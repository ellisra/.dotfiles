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

---@param group string The highlight group name
---@param options vim.api.keyset.highlight Highlight attributes
function M.set_hl(group, options)
    vim.api.nvim_set_hl(0, group, options)
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
    local is_custom_scheme = vim.fn.filereadable(
        vim.fn.stdpath('config') .. '/colors/' .. colors_name .. '.lua'
    ) == 1

    M.set_hl('StatusLineDiagnosticError', M.combine_hl('DiagnosticError', 'Normal'))
    M.set_hl('StatusLineDiagnosticWarn', M.combine_hl('DiagnosticWarn', 'Normal'))
    M.set_hl('StatusLineDiagnosticHint', M.combine_hl('DiagnosticHint', 'Normal'))
    M.set_hl('StatusLineDiagnosticInfo', M.combine_hl('DiagnosticInfo', 'Normal'))

    if palette == nil or not is_custom_scheme then
        M.set_hl('@keyword.directive.markdown', { link = 'Normal' })
        M.set_hl('@string.documentation.python', { link = 'Comment' })
        return
    end

    M.set_hl('Constant', { link = '@variable' })
    M.set_hl('Character', { link = 'String' })
    M.set_hl('Boolean', { link = '@keyword' })
    M.set_hl('Function', { fg = palette.base0B })
    M.set_hl('Identifier', { fg = palette.base0D })
    M.set_hl('String', { fg = palette.base0C })
    M.set_hl('Number', { fg = palette.base0E })
    M.set_hl('Delimiter', { fg = palette.base05 })
    M.set_hl('Special', { fg = palette.base09 })
    M.set_hl('SpecialChar', { fg = palette.base09 })
    M.set_hl('Operator', { fg = palette.base07 })
    M.set_hl('NormalFloat', { link = 'Normal' })
    M.set_hl('Float', { link = 'Normal' })
    M.set_hl('SnippetTabstop', { bg = nil })
    M.set_hl('DiagnosticError', { fg = palette.base0F })
    M.set_hl('DiagnosticWarn', { fg = palette.base0A })
    M.set_hl('DiagnosticFloatingWarn', { link = 'DiagnosticWarn' })
    M.set_hl('DiagnosticFloatingHint', { link = 'DiagnosticHint' })
    M.set_hl('DiagnosticFloatingError', { link = 'DiagnosticError' })
    M.set_hl('DiagnosticFloatingInfo', { link = 'DiagnosticInfo' })
    M.set_hl('DiagnosticUnderlineError', { sp = palette.base0F, underline = true })
    M.set_hl('DiagnosticUnderlineWarn', { sp = palette.base0A, undercurl = true })
    M.set_hl('WinSeparator', { fg = palette.base03 })
    M.set_hl('SignColumn', { bg = palette.base00 })
    M.set_hl('LineNr', { fg = palette.base03, bg = palette.base00 })
    M.set_hl('LineNrAbove', { fg = palette.base03, bg = palette.base00 })
    M.set_hl('LineNrBelow', { fg = palette.base03, bg = palette.base00 })
    M.set_hl('FoldColumn', { fg = palette.base03, bg = palette.base00 })
    M.set_hl('CursorLineNr', { fg = palette.base03, bg = palette.base01 })
    M.set_hl('CursorLineSign', { fg = palette.base03, bg = palette.base01 })
    M.set_hl('MatchParen', { bg = palette.base02, underline = true })
    M.set_hl('StatusLineNC', { fg = palette.base05, bg = palette.base01 })
    M.set_hl('StatusLineDiagnosticError', { fg = palette.base0F, bg = palette.base00 })
    M.set_hl('StatusLineDiagnosticWarn', { fg = palette.base0A, bg = palette.base00 })
    M.set_hl('StatusLineDiagnosticHint', { fg = palette.base0D, bg = palette.base00 })
    M.set_hl('StatusLineDiagnosticInfo', { fg = palette.base0C, bg = palette.base00 })

    M.set_hl('RenderMarkdownBullet', { link = 'Identifier' })
    M.set_hl('FzfLuaFzfMatch', { fg = palette.base0D })

    -- LSP tags
    M.set_hl('@keyword', { fg = palette.base08, bold = true })
    M.set_hl('@variable.parameter', { fg = palette.base04 })
    M.set_hl('@lsp.type.macro', { fg = palette.base08 })
    M.set_hl('@lsp.type.namespace', { link = 'Constant' })
    M.set_hl('@lsp.type.builtinType', { fg = palette.base0A })
    M.set_hl('@lsp.typemod.method', { link = 'Function' })
    M.set_hl('@type.builtin', { fg = palette.base0A })
    M.set_hl('@constant.builtin', { fg = palette.base0E })
    M.set_hl('@number.float', { link = 'Number' })
    M.set_hl('@lsp.mod.readonly', { link = 'Constant' })
    M.set_hl('@lsp.type.variable.python', {})
    M.set_hl('@lsp.typemod.typeParameter', { link = '@type' })
    M.set_hl('@string.documentation.python', { link = 'Comment' })
    M.set_hl('@function.builtin.lua', { link = 'Function' })
    M.set_hl('@constructor.lua', { link = 'Delimiter' })
    M.set_hl('@type.builtin.cpp', { link = '@keyword' })
    M.set_hl('@function.builtin', { link = 'Function' })
    M.set_hl('@variable.builtin', { link = 'Variable' })
    M.set_hl('@attribute.builtin', { link = 'Macro' })

    -- markdown
    M.set_hl('@markup.heading.1', { fg = palette.base08, bold = true })
    M.set_hl('@markup.heading.2', { fg = palette.base09, bold = true })
    M.set_hl('@markup.heading.3', { fg = palette.base0A, bold = true })
    M.set_hl('@markup.heading.4', { fg = palette.base0B, bold = true })
    M.set_hl('@markup.heading.5', { fg = palette.base0D, bold = true })
    M.set_hl('@markup.heading.6', { fg = palette.base0E, bold = true })
    M.set_hl('@markup.quote', { fg = palette.base04, italic = true })
    M.set_hl('@markup.list', { fg = palette.base0D })
    M.set_hl('@markup.strikethrough.markdown_inline', { strikethrough = true })
    M.set_hl('@markup.list.checked', { fg = palette.base0B })
    M.set_hl('@punctuation.special.markdown', { fg = palette.base05 })
    M.set_hl('@keyword.directive.markdown', { fg = palette.base05 })
    M.set_hl('@lsp.type.decorator.markdown', { fg = palette.base0C })
    M.set_hl('@nospell.markdown_inline', { fg = palette.base07 })
    M.set_hl('@markup.raw.markdown_inline', { bg = palette.base01 })
    M.set_hl(
        '@markup.link.label.markdown_inline',
        { fg = palette.base0D, underdotted = true }
    )

    -- mini.nvim
    M.set_hl('MiniDiffSignAdd', { fg = palette.base0B })
    M.set_hl('MiniDiffSignChange', { fg = palette.base0D })
    M.set_hl('MiniDiffSignDelete', { fg = palette.base08 })
    M.set_hl('MiniIndentscopeSymbol', { fg = palette.base03 })
    M.set_hl('MiniIndentscopeSymbolOff', { fg = palette.base03 })
    M.set_hl('MiniHipatternsHack', { fg = palette.base00, bg = palette.base09 })
    M.set_hl('MiniHipatternsTodo', { fg = palette.base00, bg = palette.base0D })
    M.set_hl('MiniHipatternsFixme', { fg = palette.base00, bg = palette.base08 })
    M.set_hl('MiniHipatternsNote', { fg = palette.base00, bg = palette.base0C })
    M.set_hl('MiniClueTitle', { link = 'Normal' })
    M.set_hl('MiniJump', { link = 'Visual' })

    -- Fyler
    M.set_hl('FylerGitModified', { fg = palette.base0A })
    M.set_hl('FylerGitUntracked', { fg = palette.base0C })
    M.set_hl('FylerGitRenamed', { fg = palette.base09 })
    M.set_hl('FylerConfirmRed', { fg = palette.base08 })

    -- Blink
    M.set_hl('BlinkCmpLabelMatch', { link = 'String' })
    M.set_hl('BlinkCmpMenu', { link = 'CursorLine' })
    M.set_hl('BlinkCmpMenuSelection', { link = 'Visual' })
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

---@param t { dirpath: string, filename: string, template_path?: string, tags?: string[] }
function M.create_note(t)
    local template_path = t.template_path or ''
    local tags = t.tags or {}
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
            table.insert(content, '# ' .. t.filename)
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

return M
