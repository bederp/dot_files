local wezterm = require("wezterm")
local act = wezterm.action
local config = {}
local keys = {}
local launch_menu = {}

--- Default config settings

config.scrollback_lines = 7000
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "flexoki-dark"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 16
config.launch_menu = launch_menu
config.default_cursor_style = "BlinkingBar"
config.use_fancy_tab_bar = false

keys = {
	-- Mac style quit
	{ key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },
	-- Moving between panes
	{ key = "LeftArrow", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CMD|SHIFT", action = act.ActivatePaneDirection("Down") }
}

config.keys = keys

return config
