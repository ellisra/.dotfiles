return {
    "folke/snacks.nvim",

    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        quickfile = { enabled = true },
        rename = { enabled = true },

        animate = { enabled = false },
        bufdelete = { enabled = false },
        debug = { enabled = false },
        dim = { enabled = false },
        git = { enabled = false },
        gitbrowse = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
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
    },
}
