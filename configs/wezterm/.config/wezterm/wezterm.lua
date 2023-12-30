-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.window_close_confirmation = "NeverPrompt"
config.font_size = 14
config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_background_opacity = 0.85
-- and finally, return the configuration to wezterm
return config
