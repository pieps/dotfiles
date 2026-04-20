local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.font = wezterm.font 'FiraCode Nerd Font'
config.color_scheme = 'Jabuti'
config.window_background_opacity = 0.8
config.text_background_opacity = 0.8
config.hide_tab_bar_if_only_one_tab = true
config.term = 'wezterm'
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'

local SOLID_LEFT_CIRCLE = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_CIRCLE = wezterm.nerdfonts.ple_right_half_circle_thick

-- From https://wezterm.org/config/lua/window-events/format-tab-title.html:
-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on('format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    if tab.is_active then
      return {
        { Foreground = { Color = '#1E1D2D' } },
        { Background = { Color = '#333333' } },
        { Text = SOLID_LEFT_CIRCLE },
        { Foreground = { Color = '#cdd6f4' } },
        { Background = { Color = '#1E1D2D' } },
        { Text = ' ' .. title .. ' ' },
        { Foreground = { Color = '#1E1D2D' } },
        { Background = { Color = '#333333' } },
        { Text = SOLID_RIGHT_CIRCLE },
      }
    end
    if tab.is_last_active then
      -- Green color and append '*' to previously active tab.
      return {
        { Background = { Color = 'green' } },
        { Text = ' ' .. title .. '*' },
      }
    end
    return title
  end
)

return config
