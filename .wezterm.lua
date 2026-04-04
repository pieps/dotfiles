local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font 'FiraCode Nerd Font'
config.color_scheme = 'Sonokai (Gogh)'
config.window_background_opacity = 0.8
config.text_background_opacity = 0.8
config.hide_tab_bar_if_only_one_tab = true
config.term = 'wezterm'

return config
