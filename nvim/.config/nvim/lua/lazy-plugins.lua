require("lazy").setup({
    -- Language Functionality
    require("plugins.blink-cmp"),
    require("plugins.conform"),
    require("plugins.treesitter"),

    -- Markdown
    require("plugins.obsidian"),
    require("plugins.render-markdown"),

    -- Navigation
    require("plugins.flash"),
    require("plugins.fzf"),

    -- QoL
    require("plugins.mini.main"),
    require("plugins.no-neck-pain"),

    -- Themes
    require("themes.base16-nvim"),
}, {
    ui = {
        border = "single",
        backdrop = 100,
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
