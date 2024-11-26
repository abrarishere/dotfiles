-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- my coolnight colorscheme
-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#011423",
-- 	cursor_bg = "#47FF9C",
-- 	cursor_border = "#47FF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#033259",
-- 	selection_fg = "#CBE0F0",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }

config.font_size = 16

config.enable_tab_bar = false

-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "ChallengerDeep"
config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.macos_window_background_blur = 10
-- config.window_padding = {
-- 	left = 0,
-- 	right = 0,
-- 	top = 0,
-- 	bottom = 0,
-- }

-- config.window_background_image = '/home/abrar/Pictures/Wallpapers/4860962.jpg'

-- config.window_background_image_hsb = {
--   -- Darken the background image by reducing it to 1/3rd
--   brightness = 0.1,
-- }
-- background
-- config.background = {
--   {
--     source = { File = "/home/abrar/Pictures/Wallpapers/4860962.jpg" },
--     opacity = 0.7
--   }
-- }
-- and finally, return the configuration to wezterm
return config
