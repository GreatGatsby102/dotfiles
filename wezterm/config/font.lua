---@class WezTerm
local wez = require "wezterm"

---@class Config
local Config = {}

Config.adjust_window_size_when_changing_font_size = false
Config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"
Config.anti_alias_custom_block_glyphs = true
Config.warn_about_missing_glyphs = false
Config.font_size = 14
Config.underline_position = -2.5
Config.underline_thickness = "2px"

-- Additional font directory (necessary to find FontAwesome font!)
Config.font_dirs = {"fonts"} -- relative to main config file

local function font_with_fallback(font_family)
  -- family names, not file names
  return wez.font_with_fallback({
    font_family,
    "Font Awesome 6 Free Solid", -- nice double-spaced symbols!
  })
end

local function font_and_rules_for_jetbrains()
  -- Use a _very slightly_ lighter variant, so that regular bold really stand out
  local font = font_with_fallback("JetBrains Mono Light")
  local font_rules = {
    {
      italic = true,
      font = font_with_fallback("JetBrains Mono Light Italic"),
    },
    {
      italic = true, intensity = "Bold",
      font = font_with_fallback("JetBrains Mono Bold Italic"),
    },
    {
      intensity = "Bold",
      font = font_with_fallback("JetBrains Mono Bold"),
    },
  }
  return font, font_rules
end

Config.font, Config.font_rules = font_and_rules_for_jetbrains()

-- Enable various OpenType features
-- See https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist
Config.harfbuzz_features = {
  "zero", -- Use a slashed zero '0' (instead of dotted)
  "kern", -- (default) kerning (todo check what is really is)
  "liga", -- (default) ligatures
  "clig", -- (default) contextual ligatures
}


return Config
