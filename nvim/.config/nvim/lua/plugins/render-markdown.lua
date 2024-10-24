return {
    "MeanderingProgrammer/render-markdown.nvim",

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },

    -- Colorscheme definition
    init = function()
        -- Foreground Colorscheme
        local red_fg = "#E67E80"
        local orange_fg = "#E69875"
        local yellow_fg = "#DBBC7F"
        local green_fg = "#A4C080"
        local blue_fg = "#7FBBB3"
        local aqua_fg = "#83C092"
        local purple_fg = "#D699B6"
        local text_fg = "#D3C6AA"

        -- Background Colorscheme
        local red_bg = "#4C3743"
        local orange_bg = "#493B40"
        local yellow_bg = "#45443C"
        local green_bg = "#3C4841"
        local blue_bg = "#384B55"
        local aqua_bg = "#3C4842"
        local purple_bg = "#463C48"

        -- Assign Heading colours
        vim.cmd(string.format([[highlight Heading1Bg guifg=%s guibg=%s]], red_fg, red_bg))
        vim.cmd(string.format([[highlight Heading2Bg guifg=%s guibg=%s]], orange_fg, orange_bg))
        vim.cmd(string.format([[highlight Heading3Bg guifg=%s guibg=%s]], yellow_fg, yellow_bg))
        vim.cmd(string.format([[highlight Heading4Bg guifg=%s guibg=%s]], green_fg, green_bg))
        vim.cmd(string.format([[highlight Heading5Bg guifg=%s guibg=%s]], blue_fg, blue_bg))
        vim.cmd(string.format([[highlight Heading6Bg guifg=%s guibg=%s]], purple_fg, purple_bg))
    end,

    --@module "render-markdown"
    --@type render.md.UserConfig
    opts = {
        heading = {
            enabled = true,
            sign = false,
            position = 'inline',
            icons = { '', '', '', '', '', '' },
            width = 'block',
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
