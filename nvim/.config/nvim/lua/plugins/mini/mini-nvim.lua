return {
    "nvim-mini/mini.nvim",

    lazy = false,
    config = function()
        -- One-liners
        require("mini.ai").setup()
        require("mini.align").setup()
        require("mini.icons").setup()
        require("mini.splitjoin").setup()

        -- Configured Plugins
        require("plugins.mini.clue")
        require("plugins.mini.diff")
        require("plugins.mini.hipatterns")
        require("plugins.mini.indentscope")
        require("plugins.mini.pairs")
        require("plugins.mini.surround")

        -- Mics Functions
        require("mini.misc").setup_termbg_sync()
    end,
}
