local M = {}

function M.select_markdown_table()
    local line_num = vim.fn.line('.')
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local pattern = '^%s*|'

    local start_line = line_num
    while start_line > 1 and lines[start_line]:match(pattern) do
        start_line = start_line - 1
    end
    if not lines[start_line]:match(pattern) then
        start_line = start_line + 1
    end

    local end_line = line_num
    while end_line <= #lines and lines[end_line]:match(pattern) do
        end_line = end_line + 1
    end
    end_line = end_line - 1

    if start_line <= #lines and lines[start_line]:match(pattern) then
        vim.fn.cursor(start_line, 1)
        vim.cmd('normal! V')
        vim.fn.cursor(end_line, 1)
    else
        print('No table found at cursor')
    end
end

---@return string
function M.get_current_filename()
    local filename = vim.fn.expand('%:t')
    filename, _ = filename:gsub('%.%w+$','')

    return filename
end

---@param path string
function M.read_file(path)
    local file = io.open(path, 'r')
    if not file then return nil end
    local content = file:read('*a')
    file:close()
    return content
end

---@param t { path: string, filename: string }
function M.insert_template(t)
    local lines = M.read_file(t.path)
    if not lines then return nil end
    lines = lines:gsub('{{title}}', t.filename)
    vim.api.nvim_put(vim.split(lines, '\n'), 'c', true, true)
end

function M.toggle_checkbox()
    local line = vim.api.nvim_get_current_line()
    local checkbox_checked_pattern = '^%s*%- %[x%]'
    local checkbox_unchecked_pattern = '^%s*%- %[ %]'
    local list_item_pattern = '^%s*%- '
    local new_line

    if line:match(checkbox_checked_pattern) then
        new_line = line:gsub('%[x%]', '[ ]')
    elseif line:match(checkbox_unchecked_pattern) then
        new_line = line:gsub('%[ %]', '[x]')
    elseif line:match(list_item_pattern) then
        new_line = line:gsub('^(%s*%- )', '%1[ ] ')
    else
        local indent = line:match('^%s*') or ''
        new_line = indent .. '- [ ] ' .. line:gsub('^%s*', '')
    end

    vim.api.nvim_set_current_line(new_line)
end

---@param t { dirpath: string, filename: string, template_path?: string, tags?: string[], title?: string }
function M.create_note(t)
    local template_path = t.template_path or ''
    local tags = t.tags or {}
    local title = t.title or t.filename
    local filepath = string.format('%s.md', vim.fs.joinpath(t.dirpath, t.filename))
    vim.cmd('edit ' .. vim.fn.fnameescape(filepath))

    if vim.fn.line('$') == 1 and vim.fn.getline(1) == '' then
        if template_path and template_path ~= '' then
            M.insert_template({ path=vim.fn.expand(template_path), filename=t.filename })
        elseif tags and #tags > 0 then
            local content = {'---', 'tags:'}
            for _, tag in ipairs(tags) do
                table.insert(content, '  - ' .. tag)
            end
            table.insert(content, '---')
            table.insert(content, '')
            table.insert(content, '# ' .. title)
            vim.api.nvim_buf_set_lines(0, 0, 0, false, content)
        else
            vim.api.nvim_buf_set_lines(0, 0, 0, false, { '# ' .. t.filename })
        end
    end
end

function M.show_git_blame()
    local line = vim.fn.line('.')
    local file = vim.fn.expand('%')
    local cmd = string.format('git blame --porcelain -L%d,%d -- "%s"', line, line, file)
    local output = vim.fn.system(cmd)

    if vim.v.shell_error ~= 0 then
        vim.notify('Git blame failed: ' .. output, vim.log.levels.ERROR)
        return
    end

    local lines = vim.split(output, '\n')
    local author, date = '', ''

    for _, line_content in ipairs(lines) do
        if line_content:match('^author ') then
            author = line_content:gsub('^author ', '')
        elseif line_content:match('^author%-time ') then
            local timestamp = line_content:gsub('^author%-time ', '')
            date = tostring(os.date('%Y-%m-%d', tonumber(timestamp)))
        end
    end

    local content = string.format('  %s • %s', author, date)
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { content })

    local win = vim.api.nvim_open_win(buf, false, {
        relative = 'cursor',
        row = -3,
        col = 0,
        width = #content,
        height = 1,
        style = 'minimal',
        border = 'single',
        focusable = false,
    })

    local function close_float()
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
        end
    end

    local group = vim.api.nvim_create_augroup('GitBlameFloat', { clear = true })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI', 'InsertEnter', 'BufLeave' }, {
        group = group,
        callback = function()
            close_float()
            vim.api.nvim_del_augroup_by_id(group)
        end,
    })
end

---@param name string
---@param split_cmd string
function M.create_split_term_command(name, split_cmd)
    vim.api.nvim_create_user_command(name, function(opts)
        local cmd = split_cmd .. ' | terminal'
        if opts.args and opts.args ~= '' then
            cmd = cmd .. ' ' .. vim.o.shell .. ' -c "' .. opts.args .. '; exec $SHELL"'
        end
        vim.cmd(cmd)
        vim.cmd.startinsert()
    end, { nargs = '*', complete = 'shellcmd', desc = 'Open teminal in split' })
end

---@param group string The highlight group name
---@param options vim.api.keyset.highlight Highlight attributes
local function hi(group, options)
    vim.api.nvim_set_hl(0, group, options)
end

local function set_statusline_highlights()
    hi('StatusLineDiagnosticError', M.combine_hl('DiagnosticError', 'Normal'))
    hi('StatusLineDiagnosticWarn', M.combine_hl('DiagnosticWarn', 'Normal'))
    hi('StatusLineDiagnosticHint', M.combine_hl('DiagnosticHint', 'Normal'))
    hi('StatusLineDiagnosticInfo', M.combine_hl('DiagnosticInfo', 'Normal'))
end

---@param t { hex_colour: string, r_tint: integer, g_tint: integer, b_tint: integer }
---@return string
function M.tint_colour(t)
    local r = tonumber(string.sub(t.hex_colour, 2, 3), 16)
    local g = tonumber(string.sub(t.hex_colour, 4, 5), 16)
    local b = tonumber(string.sub(t.hex_colour, 6, 7), 16)

    r = math.min(255, math.max(0, r + t.r_tint))
    g = math.min(255, math.max(0, g + t.g_tint))
    b = math.min(255, math.max(0, b + t.b_tint))

    return string.format('#%02X%02X%02X', r, g, b)
end

---@param fg_group string
---@param bg_group string
---@return { fg: string, bg: string }
function M.combine_hl(fg_group, bg_group)
    local fg_hl = vim.api.nvim_get_hl(0, { name = fg_group })
    local bg_hl = vim.api.nvim_get_hl(0, { name = bg_group })

    return { fg = fg_hl.fg, bg = bg_hl.bg }
end

---@param group_name string
---@return { fg: string, bg: string }
function M.invert_hl(group_name)
    local hl = vim.api.nvim_get_hl(0, { name = group_name })

    return { fg = hl.bg, bg = hl.fg }
end

---@param colorscheme_name string
function M.set_highlights(colorscheme_name)
    local palette = require('mini.base16').config.palette
    local colors_name = colorscheme_name or vim.g.colors_name

    local is_custom = vim.fn.filereadable(vim.fn.stdpath('config') .. '/colors/' .. colors_name .. '.lua') == 1
    if palette == nil or not is_custom then
        hi('@keyword.directive.markdown', { link = 'Normal' })
        hi('@string.documentation.python', { link = 'Comment' })
        set_statusline_highlights()
        return
    end

    hi('Constant', { link = '@variable' })
    hi('Character', { link = 'String' })
    hi('Boolean', { link = '@keyword' })
    hi('Function', { fg = palette.base0B })
    hi('Identifier', { fg = palette.base04 })
    hi('String', { fg = palette.base0C })
    hi('Number', { link = 'String' })
    hi('Delimiter', { fg = palette.base05 })
    hi('Special', { fg = palette.base09 })
    hi('SpecialChar', { fg = palette.base09 })
    hi('Operator', { fg = palette.base07 })
    hi('NormalFloat', { link = 'Normal' })
    hi('Float', { link = 'Normal' })
    hi('SnippetTabstop', { bg = nil })
    hi('DiagnosticError', { fg = palette.base0F })
    hi('DiagnosticWarn', { fg = palette.base09 })
    hi('DiagnosticFloatingWarn', { link = 'DiagnosticWarn' })
    hi('DiagnosticFloatingHint', { link = 'DiagnosticHint' })
    hi('DiagnosticFloatingError', { link = 'DiagnosticError' })
    hi('DiagnosticFloatingInfo', { link = 'DiagnosticInfo' })
    hi('DiagnosticUnderlineError', { sp = palette.base0F, underline = true })
    hi('DiagnosticUnderlineWarn', { sp = palette.base09, undercurl = true })
    hi('WinSeparator', { fg = palette.base04 })
    hi('SignColumn', { bg = palette.base00 })
    hi('LineNr', { fg = palette.base03, bg = palette.base00 })
    hi('LineNrAbove', { link = 'LineNr' })
    hi('LineNrBelow', { link = 'LineNr' })
    hi('FoldColumn', { link = 'LineNr' })
    hi('CursorLineNr', { fg = palette.base04, bg = palette.base01 })
    hi('CursorLineSign', { link = 'CursorLineNr' })
    hi('MatchParen', { bg = palette.base02, underline = true })
    hi('StatusLineNC', { fg = palette.base05, bg = palette.base01 })
    hi('SpellBad', { sp = palette.base0F, undercurl = true })

    hi('FzfLuaFzfMatch', { fg = palette.base0D })

    -- LSP tags
    hi('@keyword', { fg = palette.base08, bold = true })
    hi('@variable.parameter', { fg = palette.base04 })
    hi('@lsp.type.macro', { fg = palette.base08 })
    hi('@lsp.type.namespace', { link = 'Type' })
    hi('@lsp.typemod.method', { link = 'Function' })
    hi('@lsp.type.builtinType', { link = 'Type' })
    hi('@type.builtin', { link = 'Type' })
    hi('@lsp.typemod.typeParameter', { link = 'Type' })
    hi('@constant.builtin', { fg = palette.base0E })
    hi('@number.float', { link = 'Number' })
    hi('@lsp.mod.readonly', { link = 'Constant' })
    hi('@lsp.type.variable.python', {})
    hi('@string.documentation.python', { link = 'Comment' })
    hi('@function.builtin.lua', { link = 'Function' })
    hi('@constructor.lua', { link = 'Delimiter' })
    hi('@function.builtin', { link = 'Function' })
    hi('@variable.builtin', { link = 'Variable' })
    hi('@attribute.builtin', { link = 'Macro' })

    -- markdown
    hi('@markup.heading.1', { fg = palette.base06, bold = true, underdotted = true })
    hi('@markup.heading.2', { link = '@markup.heading.1' })
    hi('@markup.heading.3', { link = '@markup.heading.1' })
    hi('@markup.heading.4', { link = '@markup.heading.1' })
    hi('@markup.heading.5', { link = '@markup.heading.1' })
    hi('@markup.heading.6', { link = '@markup.heading.1' })
    hi('@markup.quote', { fg = palette.base04, italic = true })
    hi('@markup.list', { fg = palette.base0D })
    hi('@markup.strikethrough.markdown_inline', { strikethrough = true })
    hi('@markup.list.checked', { link = 'String' })
    hi('@markup.raw.markdown_inline', { fg = palette.base07, bg = palette.base01 })
    hi('@markup.link.label.markdown_inline', { fg = palette.base0C })
    hi('@punctuation.special.markdown', { fg = palette.base05 })
    hi('@keyword.directive.markdown', { fg = palette.base05 })
    hi('@lsp.type.decorator.markdown', {})
    hi('MdLinkBrackets', { link = 'Comment' })

    -- mini.nvim
    hi('MiniDiffSignAdd', { fg = palette.base0B })
    hi('MiniDiffSignChange', { fg = palette.base0D })
    hi('MiniDiffSignDelete', { fg = palette.base08 })
    hi('MiniIndentscopeSymbol', { link = 'Comment' })
    hi('MiniIndentscopeSymbolOff', { link = 'MiniIndentscopeSymbol' })
    hi('MiniHipatternsHack', { fg = palette.base00, bg = palette.base09 })
    hi('MiniHipatternsTodo', { fg = palette.base00, bg = palette.base0D })
    hi('MiniHipatternsFixme', { fg = palette.base00, bg = palette.base08 })
    hi('MiniHipatternsNote', { fg = palette.base00, bg = palette.base0C })
    hi('MiniClueTitle', { link = 'Normal' })
    hi('MiniJump', { link = 'Visual' })

    -- Fyler
    hi('FylerGitModified', { fg = palette.base0A })
    hi('FylerGitUntracked', { fg = palette.base0C })
    hi('FylerGitRenamed', { fg = palette.base09 })
    hi('FylerConfirmRed', { fg = palette.base08 })
    hi('FylerGrey', { link = 'Comment' })

    -- Blink
    hi('BlinkCmpLabelMatch', { link = 'Function' })
    hi('BlinkCmpMenu', { link = 'CursorLine' })
    hi('BlinkCmpMenuSelection', { link = 'Visual' })

    set_statusline_highlights()
end

return M
