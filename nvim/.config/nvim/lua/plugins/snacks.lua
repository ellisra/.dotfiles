return {
    "folke/snacks.nvim",

    priority = 1000,
    lazy = false,

    config = function()
        require("snacks").setup({
            bigfile = { enabled = true },
            indent = {
                enabled = true,
                priority = 1,
                char = "▏",
                only_scope = false,
                only_current = false,
                indent = { char = "▏" },
                animate = { enabled = false },
                scope = { enabled = true, char = "▏" },
                blank = {
                    char = " ",
                    hl = "SnacksIndentBlank",
                },
            },
            input = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scratch = { enabled = true },
            statuscolumn = { enabled = true },

            animate = { enabled = false },
            bufdelete = { enabled = false },
            dashboard = { enabled = false },
            debug = { enabled = false },
            dim = { enabled = false },
            git = { enabled = false },
            gitbrowse = { enabled = false },
            lazygit = { enabled = false },
            notifier = { enabled = false },
            notify = { enabled = false },
            profiler = { enabled = false },
            rename = { enabled = false },
            scroll = { enabled = false },
            terminal = { enabled = false },
            toggle = { enabled = false },
            util = { enabled = false },
            win = { enabled = false },
            words = { enabled = false },
            zen = { enabled = false },
        })
    end,
}
