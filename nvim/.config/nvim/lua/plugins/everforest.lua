-- https://github.com/neanias/everforest-nvim
return {
	{
		"neanias/everforest-nvim",

		name = "everforest",
		version = false,
		lazy = false,
		priority = 1000,

		config = function()
			require("everforest").setup({
				background = "hard",
				transparent_background_level = 0,
				italics = true,
				disable_italic_comments = true,
				sign_column_background = "none",
				ui_contrast = "low",
				dim_inactive_windows = false,
				diagnostic_text_highlight = false,
				diagnostic_virtual_text = "coloured",
				diagnostic_line_highlight = false,
				spell_foreground = false,
				show_eob = true,
				float_style = "bright",
				inlay_hints_background = "none",
				on_highlights = function(highlight_groups, palette) end,
				colours_override = function(palette) end,
			})
		end,

		init = function()
			vim.cmd.colorscheme 'everforest'
		end
	},
}
