-- Useful dotfiles: https://github.com/linkarzu/dotfiles-latest/

return {
    "MeanderingProgrammer/render-markdown.nvim",

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },

    -- Colorscheme definition
    init = function()
        require("settings.markdown-colours").setup_highlight()
    end,

    --@module "render-markdown"
    --@type render.md.UserConfig
    opts = {
        heading = {
            enabled = true,
            sign = false,
            position = "inline",
            icons = { "", "", "", "", "", "" },
            width = "block",
            right_pad = 2,
            backgrounds = {
                "Heading1Bg",
                "Heading2Bg",
                "Heading3Bg",
                "Heading4Bg",
                "Heading5Bg",
                "Heading6Bg",
            },
        },

        bullet = {
            enabled = true,
            icons = { "•" },
            highlight = "Bullet",
        },

        checkbox = {
            enabled = true,
            position = "inline",
            unchecked = {
                icon = "",
                highlight = "RenderMarkdownUnchecked",
                scope_highlight = nil,
            },
            checked = {
                icon = "",
                highlight = "RenderMarkdownChecked",
                scope_highlight = nil,
            },
            custom = {
                blocked = {
                    raw = "[>]",
                    rendered = "󰛂",
                    highlight = "",
                    scope_highlight = nil,
                },
                partial = {
                    raw = "[~]",
                    rendered = "󰎃",
                    highlight = "",
                    scope_highlight = nil,
                },
            },
        },
    },
}
