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
            local brown = colors.base0F

            -- General
            vim.api.nvim_set_hl(0, "@keyword", { fg = red })
            vim.api.nvim_set_hl(0, "@keyword.function", { fg = red })
            vim.api.nvim_set_hl(0, "@keyword.return", { fg = red })

            vim.api.nvim_set_hl(0, "@variable", { fg = fg1 })
            vim.api.nvim_set_hl(0, "@parameter", { fg = orange })

            -- Statusline
            vim.api.nvim_set_hl(0, "StatusLine", { bg = bg1, fg = fg0 })
            vim.api.nvim_set_hl(0, "StatusLineAccent", { bg = fg3, fg = bg0 })
            vim.api.nvim_set_hl(0, "StatuslineInsertAccent", { bg = green, fg = bg0 })
            vim.api.nvim_set_hl(0, "StatuslineVisualAccent", { bg = red, fg = bg0 })
            vim.api.nvim_set_hl(0, "StatuslineReplaceAccent", { bg = orange, fg = bg0 })
            vim.api.nvim_set_hl(0, "StatuslineCmdLineAccent", { bg = blue, fg = bg0 })
            vim.api.nvim_set_hl(0, "StatuslineTerminalAccent", { bg = purple, fg = bg0 })

            vim.api.nvim_set_hl(0, "LspDiagnosticsSignError", { fg = red, bg = bg1 })
            vim.api.nvim_set_hl(0, "LspDiagnosticsSignWarning", { fg = yellow, bg = bg1 })
            vim.api.nvim_set_hl(0, "LspDiagnosticsSignHint", { fg = aqua, bg = bg1 })
            vim.api.nvim_set_hl(0, "LspDiagnosticsSignInformation", { fg = blue, bg = bg1 })

            -- Markdown
            vim.api.nvim_set_hl(0, "@markup.heading.1", { fg = red })
            vim.api.nvim_set_hl(0, "@markup.heading.2", { fg = orange })
            vim.api.nvim_set_hl(0, "@markup.heading.3", { fg = yellow })
            vim.api.nvim_set_hl(0, "@markup.heading.4", { fg = green })
            vim.api.nvim_set_hl(0, "@markup.heading.5", { fg = blue })
            vim.api.nvim_set_hl(0, "@markup.heading.6", { fg = purple })
        end

        vim.cmd.colorscheme("base16-rose-pine-dawn")
        set_highlights()

        vim.api.nvim_create_autocmd("ColorScheme", {
            -- pattern("*"),
            callback = function()
                set_highlights()
            end,
        })
    end,
}
