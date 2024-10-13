require("lazy").setup({
	-- General Plugins
	"tpope/vim-sleuth", -- Detect tab size automatically
	"dhruvasagar/vim-table-mode", -- Makes markdown tables neater

	-- Configured Plugins
	require("plugins.everforest"),
	require("plugins.which-key"),
	require("plugins.lspconfig"),
	require("plugins.conform"),
	require("plugins.cmp"),
	require("plugins.todo-comments"),
	require("plugins.mini"),
	require("plugins.treesitter"),
	require("plugins.autopairs"),
	require("plugins.gitsigns"),
	require("plugins.telescope"),
	require("plugins.obsidian"),
	require("plugins.indent-blankline"),
	require("plugins.oil"),
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
