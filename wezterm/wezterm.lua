local wez = require("wezterm")
local wa = wez.action

-- Show which key table is active in the status area
wez.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

return {
	-- Fonts
	font = wez.font({
		family = "JetBrains Mono",
		weight = "Medium",
	}),

	-- Colorscheme
	color_scheme = "Solarized Dark (base16)",

	-- Key bindings
	leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		-- Resize mode
		{
			key = "r",
			mods = "LEADER",
			action = wa.ActivateKeyTable({
				name = "resize_pane",
				one_shot = false,
			}),
		},

		-- Copy mode
		{
			key = "[",
			mods = "LEADER",
			action = wa.ActivateCopyMode,
			timeout_milliseconds = 1000,
		},

		-- Open panes and tabs
		{
			key = "h",
			mods = "LEADER",
			action = wa.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "v",
			mods = "LEADER",
			action = wa.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "n",
			mods = "LEADER",
			action = wa.SpawnTab("DefaultDomain"),
		},

		-- Close panes and tabs
		-- Tabs
		{
			key = "q",
			mods = "LEADER",
			action = wa.CloseCurrentTab({ confirm = false }),
		},
		-- Pane
		{
			key = "w",
			mods = "LEADER",
			action = wa.CloseCurrentPane({ confirm = false }),
		},

		-- Move through panes and tabs
		-- Panes
		{
			key = "LeftArrow",
			mods = "LEADER",
			action = wa.ActivatePaneDirection("Left"),
			timeout_milliseconds = 1000,
		},
		{
			key = "h",
			mods = "LEADER",
			action = wa.ActivatePaneDirection("Left"),
			timeout_milliseconds = 1000,
		},
		{
			key = "RightArrow",
			mods = "LEADER",
			action = wa.ActivatePaneDirection("Right"),
			timeout_milliseconds = 1000,
		},
		{
			key = "l",
			mods = "LEADER",
			action = wa.ActivatePaneDirection("Right"),
			timeout_milliseconds = 1000,
		},
		{
			key = "UpArrow",
			mods = "LEADER",
			action = wa.ActivatePaneDirection("Up"),
			timeout_milliseconds = 1000,
		},
		{
			key = "k",
			mods = "LEADER",
			action = wa.ActivatePaneDirection("Up"),
			timeout_milliseconds = 1000,
		},
		{
			key = "DownArrow",
			mods = "LEADER",
			action = wa.ActivatePaneDirection("Down"),
			timeout_milliseconds = 1000,
		},
		{
			key = "j",
			mods = "LEADER",
			action = wa.ActivatePaneDirection("Down"),
			timeout_milliseconds = 1000,
		},
		-- Tabs
		{
			key = "j",
			mods = "ALT",
			action = wa.ActivateTabRelative(-1),
		},
		{
			key = "k",
			mods = "ALT",
			action = wa.ActivateTabRelative(1),
		},

		-- Scrolling
		{
			key = "PageUp",
			mods = "SHIFT",
			action = wa.ScrollByPage(-1),
		},
		{
			key = "PageDown",
			mods = "SHIFT",
			action = wa.ScrollByPage(1),
		},
	},

	-- Key tables
	key_tables = {
		-- Resize panes
		resize_pane = {
			{ key = "LeftArrow", action = wa.AdjustPaneSize({ "Left", 1 }) },
			{ key = "RightArrow", action = wa.AdjustPaneSize({ "Right", 1 }) },
			{ key = "UpArrow", action = wa.AdjustPaneSize({ "Up", 1 }) },
			{ key = "DownArrow", action = wa.AdjustPaneSize({ "Down", 1 }) },
			{ key = "Escape", action = "PopKeyTable" },
		},
	},

	-- Disable default keybind
	disable_default_key_bindings = true,
}
