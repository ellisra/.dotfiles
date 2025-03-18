local function set_hl(group, options)
    vim.api.nvim_set_hl(0, group, options)
end

local function set_highlights()
    local colors = require("base16-colorscheme").colors

    local bg0 = colors.base00
    local bg1 = colors.base01
    local bg2 = colors.base02
    local bg3 = colors.base03
    local fg3 = colors.base04
    local fg2 = colors.base05
    local fg1 = colors.base06
    local fg0 = colors.base07
    local red = colors.base08
    local orange = colors.base09
    local yellow = colors.base0A
    local green = colors.base0B
    local aqua = colors.base0C
    local blue = colors.base0D
    local purple = colors.base0E
    local bonus = colors.base0F

    -- General
    set_hl("@keyword", { fg = red })
    set_hl("@keyword.function", { fg = red })
    set_hl("@keyword.return", { fg = red })
    set_hl("TSAttribute", { fg = purple })
    set_hl("TSBoolean", { fg = purple })
    set_hl("TSComment", { cterm = { italic = false }, fg = bg3 })
    set_hl("TSConstant", { fg = purple })
    set_hl("TSConstructor", { fg = fg0 })
    set_hl("TSFunction", { fg = green })
    set_hl("TSFuncBuiltin", { cterm = { italic = false }, fg = green })
    set_hl("TSMethod", { fg = green })
    set_hl("TSString", { fg = aqua })
    set_hl("TSInclude", { fg = red })
    set_hl("TSOperator", { fg = orange })
    set_hl("TSPunctSpecial", { fg = blue })
    set_hl("TSNamespace", { fg = yellow })
    set_hl("TSNumber", { fg = aqua })
    set_hl("TSFloat", { fg = aqua })
    set_hl("TSTypeBuiltin", { cterm = { italic = false } })
    set_hl("@variable", { fg = fg2 })
    set_hl("@parameter", { fg = blue })
    set_hl("@property", { fg = blue })
    set_hl("@punctuation.delimiter", { fg = fg1 })
    set_hl("Directory", { fg = green })
    set_hl("@lsp.typemod.variable.readonly.python", { fg = purple })
    set_hl("DiffText", { fg = yellow })
    set_hl("CursorLineNr", { fg = orange, bg = bg1 })

    set_hl("LspReferenceRead", { bg = bg2 })
    set_hl("LspReferenceText", { link = "LspReferenceRead" })
    set_hl("LspReferenceWrite", { link = "LspReferenceRead" })

    -- Statusline
    set_hl("StatusLine", { bg = bg1, fg = fg2 })
    set_hl("StatusLineAccent", { bg = fg3, fg = bg0 })
    set_hl("StatuslineInsertAccent", { bg = green, fg = bg0 })
    set_hl("StatuslineVisualAccent", { bg = red, fg = bg0 })
    set_hl("StatuslineReplaceAccent", { bg = orange, fg = bg0 })
    set_hl("StatuslineCmdLineAccent", { bg = blue, fg = bg0 })
    set_hl("StatuslineTerminalAccent", { bg = purple, fg = bg0 })

    set_hl("LspDiagnosticsSignError", { fg = red, bg = bg1 })
    set_hl("LspDiagnosticsSignWarning", { fg = yellow, bg = bg1 })
    set_hl("LspDiagnosticsSignHint", { fg = aqua, bg = bg1 })
    set_hl("LspDiagnosticsSignInformation", { fg = blue, bg = bg1 })

    set_hl("DiagnosticWarn", { fg = yellow })
    set_hl("DiagnosticUnderlineWarn", { undercurl = true, sp = yellow })

    -- Markdown
    set_hl("@markup.heading.1", { fg = red, bold = true })
    set_hl("@markup.heading.2", { fg = orange, bold = true })
    set_hl("@markup.heading.3", { fg = yellow, bold = true })
    set_hl("@markup.heading.4", { fg = green, bold = true })
    set_hl("@markup.heading.5", { fg = blue, bold = true })
    set_hl("@markup.heading.6", { fg = purple, bold = true })
    set_hl("@markup.quote", { fg = fg3 })
    set_hl("@markup.list.checked", { fg = green })
    set_hl(
        "@markup.link.label.markdown_inline",
        { fg = blue, underdotted = true }
    )
    set_hl("SpecialChar", { fg = orange })

    set_hl("FloatTitle", { link = "Normal" })

    set_hl("MiniDiffSignAdd", { fg = green })
    set_hl("MiniDiffSignChange", { fg = blue })
    set_hl("MiniDiffSignDelete", { fg = red })

    set_hl("MiniHipatternsHack", { fg = bg0, bg = orange })
    set_hl("MiniHipatternsTodo", { fg = bg0, bg = blue })
    set_hl("MiniHipatternsFixme", { fg = bg0, bg = red })
    set_hl("MiniHipatternsNote", { fg = bg0, bg = aqua })

    set_hl("IblScope", { fg = fg3 })
end

return {
    "RRethy/base16-nvim",

    lazy = false,
    priority = 1000,

    config = function()
        require("base16-colorscheme").with_config({
            telescope = false,
        })
    end,

    init = function()
        vim.cmd.colorscheme("b16-retrobox")

        set_highlights()

        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                set_highlights()
            end,
        })

        vim.api.nvim_create_user_command("SetHighlights", set_highlights, {})
    end,
}
