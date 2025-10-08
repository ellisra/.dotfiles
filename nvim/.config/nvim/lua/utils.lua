local M = {}

function M.select_markdown_table()
    local line_num = vim.fn.line('.')
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    local start_line = line_num
    while start_line > 1 and lines[start_line]:match('^%s*|') do
        start_line = start_line - 1
    end
    if not lines[start_line]:match('^%s*|') then
        start_line = start_line + 1
    end

    local end_line = line_num
    while end_line <= #lines and lines[end_line]:match('^%s*|') do
        end_line = end_line + 1
    end
    end_line = end_line - 1

    if start_line <= #lines and lines[start_line]:match('^%s*|') then
        vim.fn.cursor(start_line, 1)
        vim.cmd('normal! V')
        vim.fn.cursor(end_line, 1)
    else
        print('No table found at cursor')
    end
end

function M.tint_colour(hex_colour, r_tint, g_tint, b_tint)
    local r = tonumber(string.sub(hex_colour, 2, 3), 16)
    local g = tonumber(string.sub(hex_colour, 4, 5), 16)
    local b = tonumber(string.sub(hex_colour, 6, 7), 16)

    r = math.min(255, math.max(0, r + r_tint))
    g = math.min(255, math.max(0, g + g_tint))
    b = math.min(255, math.max(0, b + b_tint))

    return string.format('#%02X%02X%02X', r, g, b)
end

---@param group string The highlight group name
---@param options vim.api.keyset.highlight Highlight attributes
function M.set_hl(group, options)
    vim.api.nvim_set_hl(0, group, options)
end

function M.set_highlights(colorscheme_name)
    local palette = require('mini.base16').config.palette
    local colors_name = colorscheme_name or vim.g.colors_name
    local is_custom_scheme = vim.fn.filereadable(
        vim.fn.stdpath('config') .. '/colors/' .. colors_name .. '.lua'
    ) == 1

    -- Special case for retrobox colorscheme
    if colors_name == 'retrobox' then
        M.set_hl('@lsp.type.variable', { fg = '#ebdbb2' })
        return
    end

    if palette == nil or not is_custom_scheme then
        return
    end

    M.set_hl('Constant', { fg = palette.base0E })
    M.set_hl('Boolean', { fg = palette.base0E })
    M.set_hl('Function', { fg = palette.base0B })
    M.set_hl('Identifier', { fg = palette.base0D })
    M.set_hl('String', { fg = palette.base0C })
    M.set_hl('Number', { fg = palette.base0C })
    M.set_hl('Delimiter', { fg = palette.base06 })
    M.set_hl('Special', { fg = palette.base06 })
    M.set_hl('SpecialChar', { fg = palette.base09 })
    M.set_hl('Operator', { fg = palette.base09 })
    M.set_hl('NormalFloat', { link = 'Normal' })
    M.set_hl('Float', { link = 'Normal' })
    M.set_hl('SnippetTabstop', { bg = nil })
    M.set_hl('DiagnosticWarn', { fg = palette.base0A })
    M.set_hl('DiagnosticFloatingWarn', { link = 'DiagnosticWarn' })
    M.set_hl('DiagnosticFloatingHint', { link = 'DiagnosticHint' })
    M.set_hl('DiagnosticFloatingError', { link = 'DiagnosticError' })
    M.set_hl('DiagnosticFloatingInfo', { link = 'DiagnosticInfo' })
    M.set_hl('LspDiagnosticsSignError', { link = 'DiagnosticError' })
    M.set_hl('LspDiagnosticsSignWarning', { link = 'DiagnosticWarn' })
    M.set_hl('LspDiagnosticsSignHint', { link = 'DiagnosticHint' })
    M.set_hl('LspDiagnosticsSignInformation', { link = 'DiagnosticInfo' })

    -- LSP tags
    M.set_hl('@keyword', { fg = palette.base08 })
    M.set_hl('@keyword.conditional', { fg = palette.base0E })
    M.set_hl('@keyword.operator', { fg = palette.base0E })
    M.set_hl('@variable.parameter', { fg = palette.base0D })
    M.set_hl('@lsp.type.macro', { fg = palette.base08 })
    M.set_hl('@lsp.type.namespace', { fg = palette.base0A })
    M.set_hl('@lsp.type.builtinType', { fg = palette.base0A })
    M.set_hl('@constant.builtin', { fg = palette.base0E })
    M.set_hl('@number.float', { link = 'Number' })
    M.set_hl('@lsp.mod.readonly', { link = 'Constant' })

    -- mini.nvim
    M.set_hl('MiniDiffSignAdd', { fg = palette.base0B })
    M.set_hl('MiniDiffSignChange', { fg = palette.base0D })
    M.set_hl('MiniDiffSignDelete', { fg = palette.base08 })
    M.set_hl('MiniIndentscopeSymbol', { fg = palette.base03 })
    M.set_hl('MiniHipatternsHack', { fg = palette.base00, bg = palette.base09 })
    M.set_hl('MiniHipatternsTodo', { fg = palette.base00, bg = palette.base0D })
    M.set_hl('MiniHipatternsFixme', { fg = palette.base00, bg = palette.base08 })
    M.set_hl('MiniHipatternsNote', { fg = palette.base00, bg = palette.base0C })
    M.set_hl('MiniClueTitle', { link = 'Normal' })

    -- statusline
    M.set_hl('StatusLine', { bg = palette.base01, fg = palette.base05 })
    M.set_hl('StatusLineAccent', { bg = palette.base04, fg = palette.base00 })
    M.set_hl('StatuslineInsertAccent', { bg = palette.base0B, fg = palette.base00 })
    M.set_hl('StatuslineVisualAccent', { bg = palette.base08, fg = palette.base00 })
    M.set_hl('StatuslineReplaceAccent', { bg = palette.base09, fg = palette.base00 })
    M.set_hl('StatuslineCmdLineAccent', { bg = palette.base0D, fg = palette.base00 })
    M.set_hl('StatuslineTerminalAccent', { bg = palette.base0E, fg = palette.base00 })

    M.set_hl('WinSeparator', { fg = palette.base03 })
    M.set_hl('SignColumn', { bg = palette.base00 })
    M.set_hl('LineNr', { fg = palette.base03, bg = palette.base00 })
    M.set_hl('LineNrAbove', { fg = palette.base03, bg = palette.base00 })
    M.set_hl('LineNrBelow', { fg = palette.base03, bg = palette.base00 })
    M.set_hl('FoldColumn', { fg = palette.base03, bg = palette.base00 })
    M.set_hl('CursorLineNr', { fg = palette.base03, bg = palette.base01 })
    M.set_hl('CursorLineSign', { fg = palette.base03, bg = palette.base01 })

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
    M.set_hl('@lsp.type.decorator.markdown', { fg = palette.base0C })
    M.set_hl(
        '@markup.link.label.markdown_inline',
        { fg = palette.base0D, underdotted = true }
    )

    -- fyler
    M.set_hl('FylerGitModified', { fg = palette.base0A })
    M.set_hl('FylerGitUntracked', { fg = palette.base0C })
    M.set_hl('FylerGitRenamed', { fg = palette.base09 })
    M.set_hl('FylerConfirmRed', { fg = palette.base08 })
end

return M
