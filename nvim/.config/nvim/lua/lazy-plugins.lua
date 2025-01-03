require("lazy").setup({
    -- Language Functionality
    require("plugins.blink-cmp"),
    require("plugins.conform"),
    require("plugins.indent-blankline"),
    require("plugins.lspconfig"),
    require("plugins.treesitter"),

    -- Markdown
    require("plugins.obsidian"),
    require("plugins.obsidian-bridge"),
    require("plugins.render-markdown"),

    -- Navigation
    require("plugins.flash"),
    require("plugins.oil"),
    require("plugins.telescope"),

    -- QoL
    require("plugins.lazydev"),
    require("plugins.mini"),
    require("plugins.tiny"),

    -- Snippets
    require("plugins.luasnip"),
    require("plugins.neogen"),

    -- Themes
    require("themes.gruvbox-material"),
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
