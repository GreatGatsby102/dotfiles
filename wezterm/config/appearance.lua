---@class Config
local Config = {}

local scheme = require("utils.fun").get_scheme()
Config.color_scheme = 'Bamboo Multiplex'

Config.char_select_font_size = 12

---cursor
Config.default_cursor_style = "SteadyUnderline"
Config.cursor_thickness = 1
Config.force_reverse_video_cursor = true

Config.enable_scroll_bar = true

Config.hide_mouse_cursor_when_typing = true

---window appearance
Config.window_padding = { left = 2, right = 2, top = 2, bottom = 1 }
Config.window_decorations = "RESIZE"
Config.window_close_confirmation = "NeverPrompt"

return Config
