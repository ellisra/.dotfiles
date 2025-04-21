---@type LazySpec
return {
    "folke/snacks.nvim",

    priority = 1000,
    lazy = false,

    config = function()
        require("snacks").setup({
            bigfile = { enabled = false },
            dashboard = require("plugins.snacks.dashboard"),
            indent = require("plugins.snacks.indent"),
            quickfile = { enabled = true },
            rename = { enabled = true },

            animate = { enabled = false },
            bufdelete = { enabled = false },
            debug = { enabled = false },
            dim = { enabled = false },
            git = { enabled = false },
            gitbrowse = { enabled = false },
            lazygit = { enabled = false },
            notifier = { enabled = false },
            notify = { enabled = false },
            profiler = { enabled = false },
            scope = { enabled = false },
            scratch = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            terminal = { enabled = false },
            toggle = { enabled = false },
            words = { enabled = false },
            zen = { enabled = false },
        })
    end,
}
