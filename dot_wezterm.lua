local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local wezterm = require("wezterm")
local config = {}

config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#706b4e",
	selection_fg = "#f3d9c4",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

config.harfbuzz_features = { "zero" }
config.font = wezterm.font("Special Elite")
-- config.font = wezterm.font("PT mono")
-- config.font = wezterm.font("MesloLGS Nerd Font Mono")

config.color_scheme = "3024 Night (Gogh)"
config.enable_scroll_bar = false
config.exit_behavior = "Hold"
config.font_size = 18
config.line_height = 1.0

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 8

return config
