return {
    "MeanderingProgrammer/render-markdown.nvim",

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },

    --@module "render-markdown"
    --@type render.md.UserConfig
    opts = {
        heading = {
            enabled = true,
            sign = false,
            position = 'inline',
            icons = { '', '', '', '', '', '' },
            width = 'block',
            backgrounds = {
                "",
                "",
                "",
                "",
                "",
                "",
            },
        },

        bullet = {
            enabled = true,
            icons = { '•' },
        },

        checkbox = {
            enabled = true,
            position = 'inline',
            unchecked = {
                icon = '',
                highlight = 'RenderMarkdownUnchecked',
                scope_highlight = nil,
            },
            checked = {
                icon = '',
                highlight = 'RenderMarkdownChecked',
                scope_highlight = nil,
            },
            custom = {
                blocked = {
                    raw = '[>]',
                    rendered = '󰛂',
                    highlight = '',
                    scope_highlight = nil,
                },
                partial = {
                    raw = '[~]',
                    rendered = '󰎃',
                    highlight = '',
                    scope_highlight = nil,
                },
            },
        },
    },
}
