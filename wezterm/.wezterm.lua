local wez = require('wezterm')
local cfg = wez.config_builder()

local function get_appearance()
	if wez.gui then
		return wez.gui.get_appearance()
	end
	return 'Dark'
end

local function scheme_for_appearance(appearance)
	if appearance:find('Dark') then
		return 'Arthur (Gogh)'
	else
		return 'dawnfox'
	end
end

local function weight_for_appearance(appearance)
    if appearance:find('Dark') then
        return 'Medium'
    else
        return 'DemiBold'
    end
end

local font_family = 'JetBrainsMono NFP'
local appearance = get_appearance()

cfg = {
	term = 'wezterm',
	audible_bell = 'Disabled',

	color_scheme = scheme_for_appearance(appearance),

    font = wez.font({ family = font_family, weight = weight_for_appearance(appearance) }),
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	font_size = 11,
    line_height = 1.0,
	bold_brightens_ansi_colors = 'No',
	custom_block_glyphs = false,
	hide_mouse_cursor_when_typing = true,
    font_rules = {
        {
            intensity = 'Bold',
            italic = false,
            font = wez.font({ family = font_family, weight = 'Bold' })
        }
    },

	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	show_new_tab_button_in_tab_bar = false,
	tab_bar_at_bottom = true,
	tab_max_width = 24,

	window_decorations = 'RESIZE',
	window_close_confirmation = 'NeverPrompt',
}

return cfg
