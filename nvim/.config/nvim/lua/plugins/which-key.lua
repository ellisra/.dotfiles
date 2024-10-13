-- https://github.com/folke/which-key.nvim
return {
	{
		"folke/which-key.nvim",

		event = "VimEnter",

		config = function()
			require("which-key").setup()
		end,
	},
}
