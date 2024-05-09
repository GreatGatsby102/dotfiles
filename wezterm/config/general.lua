---@class WezTerm
local wez = require "wezterm"

local fun = require "utils.fun" ---@class Fun

---@class Config
local Config = {}

Config.default_domain = 'WSL:Debian'
Config.default_cwd = fun.home
Config.default_prog = { '/usr/bin/zsh'}

return Config
