local M = {}

function M.set_colorscheme_on_bg()
    if vim.o.background == 'light' then
        vim.cmd.colorscheme(vim.g.light_default)
    else
        vim.cmd.colorscheme(vim.g.dark_default)
    end
end

--- @param group string The highlight group name
--- @param options vim.api.keyset.highlight Highlight attributes
local function hi(group, options)
    vim.api.nvim_set_hl(0, group, options)
end

--- @param fg_group string
--- @param bg_group string
--- @return { fg: string, bg: string }
local function combine_hl(fg_group, bg_group)
    local fg_hl = vim.api.nvim_get_hl(0, { name = fg_group })
    local bg_hl = vim.api.nvim_get_hl(0, { name = bg_group })

    return { fg = fg_hl.fg, bg = bg_hl.bg }
end

--- @param group_name string
--- @return { fg: string, bg: string }
local function invert_hl(group_name)
    local hl = vim.api.nvim_get_hl(0, { name = group_name })

    return { fg = hl.bg, bg = hl.fg }
end

local function set_statusline_highlights()
    hi('StatuslineDiagnosticError', combine_hl('DiagnosticError', 'Normal'))
    hi('StatuslineDiagnosticWarn', combine_hl('DiagnosticWarn', 'Normal'))
    hi('StatuslineDiagnosticHint', combine_hl('DiagnosticHint', 'Normal'))
    hi('StatuslineDiagnosticInfo', combine_hl('DiagnosticInfo', 'Normal'))
    hi('NormalFunction', combine_hl('Function', 'Normal'))
    hi('StatuslineModeNormal', invert_hl('Normal'))
    hi('StatuslineModeInsert', invert_hl('NormalFunction'))
    hi('StatuslineModeVisual', invert_hl('StatuslineDiagnosticError'))
    hi('StatuslineModeReplace', invert_hl('StatuslineDiagnosticWarn'))
    hi('StatuslineModeCommand', invert_hl('StatuslineDiagnosticHint'))
end

--- @param t { hex_colour: string, r_tint: integer, g_tint: integer, b_tint: integer }
--- @return string
function M.tint_colour(t)
    local r = tonumber(string.sub(t.hex_colour, 2, 3), 16)
    local g = tonumber(string.sub(t.hex_colour, 4, 5), 16)
    local b = tonumber(string.sub(t.hex_colour, 6, 7), 16)

    r = math.min(255, math.max(0, r + t.r_tint))
    g = math.min(255, math.max(0, g + t.g_tint))
    b = math.min(255, math.max(0, b + t.b_tint))

    return string.format('#%02X%02X%02X', r, g, b)
end

--- @param colorscheme_name string
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

    hi('Constant', { link = 'Number' })
    hi('Comment', { fg = palette.base06 })
    hi('Character', { link = 'String' })
    hi('Boolean', { link = 'Number' })
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
    hi('DiagnosticUnnecessary', { link = 'LineNr' })
    hi('WinSeparator', { fg = palette.base04 })
    hi('SignColumn', { bg = palette.base00 })
    hi('LineNr', { fg = palette.base03 })
    hi('LineNrAbove', { link = 'LineNr' })
    hi('LineNrBelow', { link = 'LineNr' })
    hi('FoldColumn', { link = 'LineNr' })
    hi('CursorLineNr', { fg = palette.base04, bg = palette.base01 })
    hi('CursorLineSign', { link = 'CursorLineNr' })
    hi('MatchParen', { fg = palette.base09, bg = palette.base02, underline = true })
    hi('StatuslineNC', { fg = palette.base05, bg = palette.base01 })
    hi('SpellBad', { sp = palette.base0F, undercurl = true })

    hi('FzfLuaFzfMatch', { link = 'String' })
    hi('FzfLuaDirPart', { link = 'LineNr' })
    hi('FzfLuaFzfPrompt', { link = 'LineNr' })

    -- LSP tags
    -- hi('@keyword', { fg = palette.base08, bold = true })
    hi('@keyword', { fg = palette.base08 })
    hi('@keyword.return', { link = '@keyword' })
    hi('@variable.parameter', { italic = true, fg = palette.base05 })
    hi('@lsp.typemod.variable.readonly', { link = 'Constant' })
    hi('@lsp.type.macro', { fg = palette.base08 })
    hi('@lsp.type.namespace', { link = 'Type' })
    hi('@lsp.typemod.method', { link = 'Function' })
    hi('@lsp.type.builtinType', { link = 'Type' })
    hi('@type.builtin', { link = 'Type' })
    hi('@lsp.typemod.typeParameter', { link = 'Type' })
    hi('@constant.builtin', { link = 'Constant' })
    hi('@number.float', { link = 'Number' })
    hi('@lsp.mod.readonly', { link = '@variable' })
    hi('@lsp.type.variable.python', {})
    hi('@string.documentation.python', { link = 'Comment' })
    hi('@function.builtin.lua', { link = 'Function' })
    hi('@constructor.lua', { link = 'Delimiter' })
    hi('@function.builtin', { link = 'Function' })
    hi('@variable.builtin', { link = 'Variable' })
    hi('@attribute.builtin', { link = 'Macro' })

    -- markdown
    hi('@markup.heading.1', { fg = palette.base0B, bold = true, underdotted = true })
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
    hi('@markup.link.markdown_inline', { link = 'Comment' })
    hi('@lsp.typemod.enumMember.defaultLibrary.rust', { link = 'Type' })
    hi('MdLinkBrackets', { link = 'Comment' })

    -- mini.nvim
    hi('MiniDiffSignAdd', { fg = palette.base0C })
    hi('MiniDiffSignChange', { fg = palette.base0D })
    hi('MiniDiffSignDelete', { fg = palette.base0F })
    hi('MiniIndentscopeSymbol', { link = 'LineNr' })
    hi('MiniIndentscopeSymbolOff', { link = 'MiniIndentscopeSymbol' })
    hi('MiniHipatternsHack', { fg = palette.base00, bg = palette.base09 })
    hi('MiniHipatternsTodo', { fg = palette.base00, bg = palette.base0D })
    hi('MiniHipatternsFixme', { fg = palette.base00, bg = palette.base0F })
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
    hi('BlinkCmpLabelMatch', { link = 'String' })
    hi('BlinkCmpMenu', { link = 'CursorLine' })
    hi('BlinkCmpMenuSelection', { link = 'Visual' })

    set_statusline_highlights()
end

return M
