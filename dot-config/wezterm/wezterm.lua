local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Colorscheme
local catppuccin = wezterm.plugin.require('https://github.com/catppuccin/wezterm')
catppuccin.apply_to_config(config)
-- local jabuti = wezterm.plugin.require('file:///Users/pieps/code/jabuti')
-- jabuti.apply_to_config(config)

-- Aesthetic Night Colorscheme
config.bold_brightens_ansi_colors = true

-- Font
local font_name = 'FiraCode Nerd Font'
config.font = wezterm.font(font_name)
-- Uncomment for bolder font
-- config.font_rules = {
--   {
--     italic = true,
--     font = wezterm.font(font_name, { italic = true }),
--   },
--   {
--     italic = false,
--     font = wezterm.font(font_name, { bold = true }),
--   },
--   {
--     intensity = "Bold",
--     font = wezterm.font(font_name, { bold = true }),
--   },
-- }

-- Window
-- config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.window_background_opacity = 0.8
config.text_background_opacity = 0.8
-- config.inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 }

-- Padding
-- config.window_padding = {
--   left = 25,
--   right = 25,
--   top = 25,
--   bottom = 25,
-- }

-- Tab Bar
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
-- config.tab_bar_at_bottom = true

return config
