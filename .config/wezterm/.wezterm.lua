local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- config.color_scheme = 'Batman'

config.font = wezterm.font("FiraCode Nerd Font")
-- Spawn a fish shell in login mode
config.default_prog = { "pwsh.ext", "-NoLogo" }

config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font("FiraCode Nerd Font"),

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 12.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = "#333333",

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = "#333333",
}

config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = "#575757",
  },
}

config.color_scheme = "Banana Blueberry"
config.window_background_opacity = 0.85
config.enable_scroll_bar = true

return config
