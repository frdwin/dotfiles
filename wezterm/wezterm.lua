local wez = require("wezterm")

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
		-- Split Panes
		{
			key = "h",
			mods = "LEADER",
			action = wez.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "v",
			mods = "LEADER",
			action = wez.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},

		-- Resize mode
		{
			key = "r",
			mods = "LEADER",
			action = wez.action.ActivateKeyTable({
				name = "resize_pane",
				one_shot = false,
			}),
		},

		-- Move through panes
		{
			key = "LeftArrow",
			mods = "LEADER",
			action = wez.action.ActivatePaneDirection("Left"),
			timeout_milliseconds = 1000,
		},
		{
			key = "h",
			mods = "LEADER",
			action = wez.action.ActivatePaneDirection("Left"),
			timeout_milliseconds = 1000,
		},
		{
			key = "RightArrow",
			mods = "LEADER",
			action = wez.action.ActivatePaneDirection("Right"),
			timeout_milliseconds = 1000,
		},
		{
			key = "l",
			mods = "LEADER",
			action = wez.action.ActivatePaneDirection("Right"),
			timeout_milliseconds = 1000,
		},
		{
			key = "UpArrow",
			mods = "LEADER",
			action = wez.action.ActivatePaneDirection("Up"),
			timeout_milliseconds = 1000,
		},
		{
			key = "k",
			mods = "LEADER",
			action = wez.action.ActivatePaneDirection("Up"),
			timeout_milliseconds = 1000,
		},
		{
			key = "DownArrow",
			mods = "LEADER",
			action = wez.action.ActivatePaneDirection("Down"),
			timeout_milliseconds = 1000,
		},
		{
			key = "j",
			mods = "LEADER",
			action = wez.action.ActivatePaneDirection("Down"),
			timeout_milliseconds = 1000,
		},
	},

	key_tables = {
		-- Resize panes
		resize_pane = {
			{ key = "LeftArrow", action = wez.action.AdjustPaneSize({ "Left", 1 }) },
			{ key = "RightArrow", action = wez.action.AdjustPaneSize({ "Right", 1 }) },
			{ key = "UpArrow", action = wez.action.AdjustPaneSize({ "Up", 1 }) },
			{ key = "DownArrow", action = wez.action.AdjustPaneSize({ "Down", 1 }) },
			{ key = "Escape", action = "PopKeyTable" },
		},
	},
}
