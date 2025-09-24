local wez = require("wezterm")
local cfg = wez.config_builder()

local function get_appearance()
	if wez.gui then
		return wez.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Kanagawa (Gogh)"
	else
		return "dawnfox"
	end
end

cfg = {
	audible_bell = "Disabled",

	color_scheme = scheme_for_appearance(get_appearance()),

	font = wez.font("JetBrainsMono Nerd Font Propo", { weight = "Regular" }),
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	font_size = 11.3,
	bold_brightens_ansi_colors = "No",
	custom_block_glyphs = false,
	hide_mouse_cursor_when_typing = true,

	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	show_new_tab_button_in_tab_bar = false,
	tab_bar_at_bottom = true,
	tab_max_width = 24,

	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
}

return cfg
