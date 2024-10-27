-- https://github.com/neanias/everforest-nvim
return {
    {
        "neanias/everforest-nvim",

        name = "everforest",
        version = false,
        lazy = false,
        priority = 1000,

        config = function()
            require("everforest").setup({
                background = "hard",
                transparent_background_level = 0,
                italics = false,
                disable_italic_comments = true,
                sign_column_background = "none",
                ui_contrast = "low",
                dim_inactive_windows = false,
                diagnostic_text_highlight = false,
                diagnostic_virtual_text = "coloured",
                diagnostic_line_highlight = false,
                spell_foreground = false,
                show_eob = true,
                float_style = "bright",
                inlay_hints_background = "none",
                on_highlights = function(highlight_groups, palette) end,
                colours_override = function(palette)
                    palette.fg = "#c9c7cd"
                    palette.red = "#ea83a5"
                    palette.orange = "#f5a191"
                    palette.yellow = "#e6b99d"
                    palette.green = "#90b99f"
                    palette.aqua = "#83c092"
                    palette.blue = "#85b5ba"
                    palette.purple = "#e29eca"

                    palette.bg1 = "#2c2b3c"
                    palette.bg2 = "#2a273f"
                    palette.bg3 = "#21202f"
                    palette.statusline1 = "#90b99f"
                    palette.statusline2 = "#c9c7cd"
                    palette.statusline3 = "#ea83a5"
                end,
            })
        end,

        init = function()
            vim.cmd.colorscheme("everforest")
        end,
    },
}
