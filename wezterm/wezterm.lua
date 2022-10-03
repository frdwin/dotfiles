local wezterm = require 'wezterm'

return {

	-- Key binding
	keys = {
		{
			key = 'Enter',
			mods = 'CTRL',
			action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
		},
		{
			key = 'Enter',
			mods = 'SHIFT|CTRL',
			action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
		},
		{
			key = 'q',
			mods = 'SHIFT|CTRL',
			action = wezterm.action.CloseCurrentPane { confirm = false }
		}
	},

	-- Appearance
	
	-- Font
	--font = wezterm.font 'Iosevka',

	-- Colorscheme
	color_scheme = 'Monokai Soda',

	-- Tab and pane
	hide_tab_bar_if_only_one_tab = true,
	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.8
	},

	-- Opacity
	window_background_opacity = 0.9,

	-- Padding
	window_padding = {
		left = '1%',
		right = '1%',
		top = '3%',
		bottom = '3%'
	}

}
