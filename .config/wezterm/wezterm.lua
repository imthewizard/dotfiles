local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end
config:set_strict_mode(true)


--[[ Initial Config ]]--

config.font = wezterm.font("IosevkaTerm Nerd Font Mono")
config.font_size = 10
config.color_scheme = "3024 (base16)"

--[[ Initial Config End ]]--


--[[ Keybinds ]]--

local splitIntegration = require("split-integration")
config.keys = {
	{key = 'h', mods = 'CTRL', action = wezterm.action_callback(function(window, pane) splitIntegration.MoveOrSplit(window, pane, 'h') end)},
	{key = 'j', mods = 'CTRL', action = wezterm.action_callback(function(window, pane) splitIntegration.MoveOrSplit(window, pane, 'j') end)},
	{key = 'k', mods = 'CTRL', action = wezterm.action_callback(function(window, pane) splitIntegration.MoveOrSplit(window, pane, 'k') end)},
	{key = 'l', mods = 'CTRL', action = wezterm.action_callback(function(window, pane) splitIntegration.MoveOrSplit(window, pane, 'l') end)},

	{key = 'h', mods = 'CTRL|SHIFT', action = wezterm.action_callback(function(window, pane) splitIntegration.Resize(window, pane, 'h') end)},
	{key = 'j', mods = 'CTRL|SHIFT', action = wezterm.action_callback(function(window, pane) splitIntegration.Resize(window, pane, 'j') end)},
	{key = 'k', mods = 'CTRL|SHIFT', action = wezterm.action_callback(function(window, pane) splitIntegration.Resize(window, pane, 'k') end)},
	{key = 'l', mods = 'CTRL|SHIFT', action = wezterm.action_callback(function(window, pane) splitIntegration.Resize(window, pane, 'l') end)},
}

--[[ Keybinds End ]]--

return config

