local wez = require("wezterm")
local cfg = wez.config_builder()

cfg = {
	audible_bell = "Disabled",

	color_scheme = "Kanagawa (Gogh)",

	font = wez.font("JetBrainsMono Nerd Font Propo", { weight = "DemiBold" }),
	-- font = wez.font("JetBrainsMono Nerd Font Propo"),
	font_size = 13,
	bold_brightens_ansi_colors = "No",
	freetype_load_flags = "NO_HINTING",
	custom_block_glyphs = false,

	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	show_new_tab_button_in_tab_bar = false,
	tab_max_width = 24,

	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
}

return cfg
