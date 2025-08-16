local M = {}

---Selects markdown table under cursor in visual line mode
function M.select_markdown_table()
    local line_num = vim.fn.line(".")
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    -- Find table start (look backwards for first line starting with |)
    local start_line = line_num
    while start_line > 1 and lines[start_line]:match("^%s*|") do
        start_line = start_line - 1
    end
    -- If we went too far back, move forward one line
    if not lines[start_line]:match("^%s*|") then
        start_line = start_line + 1
    end

    -- Find table end (look forwards for last line starting with |)
    local end_line = line_num
    while end_line <= #lines and lines[end_line]:match("^%s*|") do
        end_line = end_line + 1
    end
    -- Move back to the last actual table line
    end_line = end_line - 1

    -- Check if we're actually in a table
    if start_line <= #lines and lines[start_line]:match("^%s*|") then
        -- Move to start of table and begin visual selection
        vim.fn.cursor(start_line, 1)
        vim.cmd("normal! V")
        -- Extend selection to end of table
        vim.fn.cursor(end_line, 1)
    else
        print("No table found at cursor")
    end
end

function M.tint_colour(hex_colour, r_tint, g_tint, b_tint)
    local r = tonumber(string.sub(hex_colour, 2, 3), 16)
    local g = tonumber(string.sub(hex_colour, 4, 5), 16)
    local b = tonumber(string.sub(hex_colour, 6, 7), 16)

    r = math.min(255, math.max(0, r + r_tint))
    g = math.min(255, math.max(0, g + g_tint))
    b = math.min(255, math.max(0, b + b_tint))

    return string.format("#%02X%02X%02X", r, g, b)
end

---@param group string The highlight group name
---@param options vim.api.keyset.highlight Highlight attributes
function M.set_hl(group, options)
    vim.api.nvim_set_hl(0, group, options)
end

function M.set_highlights()
    local palette = require("base16-colorscheme").colors
    if palette == nil then
        return
    end

    local bg0 = palette.base00
    local bg1 = palette.base01
    local bg2 = palette.base02
    local bg3 = palette.base03
    local fg3 = palette.base04
    local fg2 = palette.base05
    local fg1 = palette.base06
    local fg0 = palette.base07
    local red = palette.base08
    local orange = palette.base09
    local yellow = palette.base0A
    local green = palette.base0B
    local aqua = palette.base0C
    local blue = palette.base0D
    local purple = palette.base0E
    local bonus = palette.base0F

    -- General
    M.set_hl("@keyword", { fg = red })
    M.set_hl("@keyword.function", { fg = red })
    M.set_hl("@keyword.return", { fg = red })
    M.set_hl("SnippetTabstop", { bg = nil })
    M.set_hl("TSAttribute", { fg = purple })
    M.set_hl("TSLiteral", { fg = bonus })
    M.set_hl("TSBoolean", { fg = purple })
    M.set_hl("TSComment", { italic = false, fg = bg3 })
    M.set_hl("TSConstant", { fg = purple })
    M.set_hl("TSConstructor", { fg = fg1 })
    M.set_hl("TSFunction", { fg = green })
    M.set_hl("TSFuncBuiltin", { italic = false, fg = green })
    M.set_hl("TSMethod", { fg = green })
    M.set_hl("TSString", { fg = aqua })
    M.set_hl("TSInclude", { fg = red })
    M.set_hl("TSOperator", { fg = orange })
    M.set_hl("TSPunctSpecial", { fg = blue })
    M.set_hl("TSNamespace", { fg = yellow })
    M.set_hl("TSNumber", { fg = aqua })
    M.set_hl("TSFloat", { fg = aqua })
    M.set_hl("TSTypeBuiltin", { italic = false })
    M.set_hl("TSURI", { fg = blue, underdotted = true })
    M.set_hl("@variable", { fg = fg2 })
    M.set_hl("@parameter", { fg = blue })
    M.set_hl("@property", { fg = blue })
    M.set_hl("@punctuation.delimiter", { fg = fg1 })
    M.set_hl("Directory", { fg = green })
    M.set_hl("@lsp.typemod.variable.readonly.python", { fg = purple })
    M.set_hl("DiffText", { fg = yellow })

    M.set_hl("LspReferenceRead", { bg = bg2 })
    M.set_hl("LspReferenceText", { link = "LspReferenceRead" })
    M.set_hl("LspReferenceWrite", { link = "LspReferenceRead" })

    -- Statusline
    M.set_hl("StatusLine", { bg = bg1, fg = fg2 })
    M.set_hl("StatusLineAccent", { bg = fg3, fg = bg0 })
    M.set_hl("StatuslineInsertAccent", { bg = green, fg = bg0 })
    M.set_hl("StatuslineVisualAccent", { bg = red, fg = bg0 })
    M.set_hl("StatuslineReplaceAccent", { bg = orange, fg = bg0 })
    M.set_hl("StatuslineCmdLineAccent", { bg = blue, fg = bg0 })
    M.set_hl("StatuslineTerminalAccent", { bg = purple, fg = bg0 })

    M.set_hl("LspDiagnosticsSignError", { fg = red, bg = bg1 })
    M.set_hl("LspDiagnosticsSignWarning", { fg = yellow, bg = bg1 })
    M.set_hl("LspDiagnosticsSignHint", { fg = aqua, bg = bg1 })
    M.set_hl("LspDiagnosticsSignInformation", { fg = blue, bg = bg1 })

    M.set_hl("DiagnosticWarn", { fg = yellow })
    M.set_hl("DiagnosticUnderlineWarn", { undercurl = true, sp = yellow })

    -- Markdown
    M.set_hl("@markup.heading.1", { fg = red, bold = true })
    M.set_hl("@markup.heading.2", { fg = orange, bold = true })
    M.set_hl("@markup.heading.3", { fg = yellow, bold = true })
    M.set_hl("@markup.heading.4", { fg = green, bold = true })
    M.set_hl("@markup.heading.5", { fg = blue, bold = true })
    M.set_hl("@markup.heading.6", { fg = purple, bold = true })
    M.set_hl("@markup.quote", { fg = fg3, italic = true })
    M.set_hl("@markup.list.checked", { fg = green })
    M.set_hl("@markup.strikethrough.markdown_inline", { strikethrough = true })
    M.set_hl("@lsp.type.decorator.markdown", { fg = aqua })
    M.set_hl(
        "@markup.link.label.markdown_inline",
        { fg = blue, underdotted = true }
    )
    M.set_hl("SpecialChar", { fg = orange })

    M.set_hl("FloatTitle", { link = "Normal" })

    M.set_hl("MiniDiffSignAdd", { fg = green })
    M.set_hl("MiniDiffSignChange", { fg = blue })
    M.set_hl("MiniDiffSignDelete", { fg = red })
    M.set_hl("MiniIndentscopeSymbol", { fg = bg3 })
    M.set_hl("MiniHipatternsHack", { fg = bg0, bg = orange })
    M.set_hl("MiniHipatternsTodo", { fg = bg0, bg = blue })
    M.set_hl("MiniHipatternsFixme", { fg = bg0, bg = red })
    M.set_hl("MiniHipatternsNote", { fg = bg0, bg = aqua })

    M.set_hl("FzfLuaLivePrompt", { link = "Normal" })
end

return M
