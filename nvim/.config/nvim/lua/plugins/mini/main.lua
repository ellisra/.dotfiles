---@type LazySpec
return {
    "echasnovski/mini.nvim",

    lazy = false,
    config = function()
        -- One-liners
        require("mini.ai").setup({})
        require("mini.align").setup({})
        require("mini.icons").setup({})
        require("mini.pairs").setup({})

        -- Configured Plugins
        require("plugins.mini.clue")
        require("plugins.mini.diff")
        require("plugins.mini.files")
        require("plugins.mini.hipatterns")
        require("plugins.mini.indentscope")
        -- require("plugins.mini.starter")
        require("plugins.mini.surround")
    end,
}
