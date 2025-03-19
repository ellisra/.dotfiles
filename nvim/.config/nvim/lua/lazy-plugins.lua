require("lazy").setup({
    { "HawkinsT/pathfinder.nvim" },

    -- Language Functionality
    require("plugins.blink-cmp"),
    require("plugins.conform"),
    require("plugins.lspconfig"),
    require("plugins.treesitter"),

    -- Markdown
    require("plugins.obsidian"),
    require("plugins.render-markdown"),

    -- Navigation
    require("plugins.flash"),
    require("plugins.fzf"),

    -- QoL
    require("plugins.lazydev"),
    require("plugins.mini.main"),
    require("plugins.snacks.main"),

    -- Snippets
    require("plugins.luasnip"),
    require("plugins.neogen"),

    -- Themes
    require("themes.base16-nvim"),
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
