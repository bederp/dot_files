local wezterm = require("wezterm")
local act = wezterm.action
local config = {}
local keys = {}
local launch_menu = {}

--- Default config settings
config.default_prog = { "powershell.exe", "-NoLogo" }
config.scrollback_lines = 7000
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "flexoki-dark"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 12
config.launch_menu = launch_menu
config.default_cursor_style = "BlinkingBar"
config.use_fancy_tab_bar = false

keys = {
	{ key = "1", mods = "CTRL", action = act.ActivateTab(0) },
	{ key = "2", mods = "CTRL", action = act.ActivateTab(1) },
	{ key = "3", mods = "CTRL", action = act.ActivateTab(2) },
	{ key = "4", mods = "CTRL", action = act.ActivateTab(3) },
	{ key = "5", mods = "CTRL", action = act.ActivateTab(4) },
	-- Mac style quit
	{ key = "w", mods = "CTRL", action = act.CloseCurrentPane({ confirm = true }) },
	-- Moving between panes
	{ key = "LeftArrow", mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT|SHIFT", action = act.ActivatePaneDirection("Down") },
	-- Disable to ctrl + shift select text in terminal
	{ key = "LeftArrow", mods = "SHIFT|CTRL", action = act.DisableDefaultAssignment },
	{ key = "RightArrow", mods = "SHIFT|CTRL", action = act.DisableDefaultAssignment },
	{ key = "t", mods = "CTRL", action = act.SpawnTab("DefaultDomain") },
}

config.keys = keys

return config
