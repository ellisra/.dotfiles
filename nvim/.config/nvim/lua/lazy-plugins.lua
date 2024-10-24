require("lazy").setup({
    -- General Plugins
    "tpope/vim-sleuth", -- Detect tab size automatically
    "dhruvasagar/vim-table-mode", -- Makes markdown tables neater

    -- Configured Plugins
    require("plugins.autopairs"),
    require("plugins.cmp"),
    require("plugins.conform"),
    require("plugins.everforest"),
    require("plugins.gitsigns"),
    require("plugins.indent-blankline"),
    require("plugins.lazygit"),
    require("plugins.lspconfig"),
    require("plugins.lualine"),
    require("plugins.mini"),
    require("plugins.obsidian"),
    require("plugins.oil"),
    require("plugins.render-markdown"),
    require("plugins.telescope"),
    require("plugins.todo-comments"),
    require("plugins.treesitter"),
    require("plugins.which-key"),
}, {
    ui = {
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
