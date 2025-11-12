return {
    'wtfox/jellybeans.nvim',
    lazy = false,
    priority = 1000,

    opts = {
        on_highlights = function(hl, c)
            hl.NormalFloat = { link = 'Normal' }
        end
    }
}
