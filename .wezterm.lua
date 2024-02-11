local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action
local config = {}
local keys = {}
local mouse_bindings = {}
local launch_menu = {}
local haswork, work = pcall(require, "work")

--- Setup PowerShell options
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	--- Grab the ver info for later use.
	local success, stdout, stderr = wezterm.run_child_process({ "cmd.exe", "ver" })
	local major, minor, build, rev = stdout:match("Version ([0-9]+)%.([0-9]+)%.([0-9]+)%.([0-9]+)")
	local is_windows_11 = tonumber(build) >= 22000

	--- Make it look cool.
	if is_windows_11 then
		wezterm.log_info("We're running Windows 11!")
	end

	--- Set Pwsh as the default on Windows
	config.default_prog = { "powershell.exe", "-NoLogo" }
end

--- Default config settings
config.scrollback_lines = 7000
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = 'flexoki-dark'
config.font = wezterm.font "Hack Nerd Font"
config.font_size = 12
config.launch_menu = launch_menu
config.default_cursor_style = "BlinkingBar"

keys = {
  { key = '1', mods = 'CTRL', action = act.ActivateTab(0) },
  { key = '2', mods = 'CTRL', action = act.ActivateTab(1) },
  { key = '3', mods = 'CTRL', action = act.ActivateTab(2) },
  { key = '4', mods = 'CTRL', action = act.ActivateTab(3) },
  { key = '5', mods = 'CTRL', action = act.ActivateTab(4) },
  -- Mac style quit
  { key = 'w', mods = 'CTRL', action = act.CloseCurrentPane { confirm = true } },
  -- Moving between panes
  { key = 'LeftArrow', mods = 'ALT|SHIFT', action = act.ActivatePaneDirection 'Left'},
  { key = 'RightArrow', mods = 'ALT|SHIFT', action = act.ActivatePaneDirection 'Right'},
  { key = 'UpArrow', mods = 'ALT|SHIFT', action = act.ActivatePaneDirection 'Up'},
  { key = 'DownArrow', mods = 'ALT|SHIFT', action = act.ActivatePaneDirection 'Down'},
  -- Disable to ctrl + shift select text in terminal
  { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.DisableDefaultAssignment},
  { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.DisableDefaultAssignment},
}

config.keys = keys

return config
