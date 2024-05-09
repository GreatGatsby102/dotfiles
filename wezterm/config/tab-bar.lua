---@class Config
local Config = {}

Config.switch_to_last_active_tab_when_closing_tab = true
Config.tab_bar_at_bottom = true
Config.tab_max_width = 25
Config.use_fancy_tab_bar = false


-- Tab Colors
Config.colors = {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    background = '#0b0022',
    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#2b2042',
      -- The color of the text for the tab
      fg_color = '#c0c0c0',
      -- label shown for tab.
      intensity = 'Half',
    },
    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = { bg_color = '#1b1032', fg_color = '#808080', },
    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,
    },
    -- The new tab button that let you create new tabs
    new_tab = { bg_color = '#1b1032', fg_color = '#808080', },
    -- Styling when mouse pointer moves over new tab button
    new_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,
    },
  },
}

return Config
