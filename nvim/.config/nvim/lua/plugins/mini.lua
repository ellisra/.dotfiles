return {
    'nvim-mini/mini.nvim',

    lazy = false,
    config = function()
        -- One-liners
        require('mini.ai').setup()
        require('mini.align').setup()
        require('mini.icons').setup()
        require('mini.jump').setup()
        require('mini.pairs').setup({ modes = { insert = true, command = true } })
        require('mini.splitjoin').setup()
        require('mini.surround').setup()

        -- Configured Modules
        require('plugins.mini-clue')
        require('plugins.mini-diff')
        require('plugins.mini-hipatterns')
        require('plugins.mini-indentscope')
        require('plugins.mini-keymap')

        -- Mics Functions
        require('mini.misc').setup_termbg_sync()
    end,
}
