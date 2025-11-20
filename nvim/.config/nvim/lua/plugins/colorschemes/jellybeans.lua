return {
    'wtfox/jellybeans.nvim',
    lazy = false,
    priority = 1000,

    config = {
        background = {
            light = 'jellybeans_mono_light',
        },

        on_colors = function(c)
            -- c.accent_color_1 = vim.o.background == 'light' and '#9A7D5F'
            c.accent_color_1 = vim.o.background == 'light' and '#C08050'
        end,

        on_highlights = function(hl, c)
            hl.NormalFloat = { link = 'Normal' }
        end,
    },
}
