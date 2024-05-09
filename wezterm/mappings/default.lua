local wezterm = require("wezterm")
local act = wezterm.action
local fun = require "utils.fun" ---@class Fun

---@class Config
local Config = {}


Config.keys = {
    -- Vim motions
    { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left', },
    { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right', },
    {key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up', },
    {key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down', },
    { key = '"',mods = 'ALT|SHIFT', action = wezterm.action.SplitHorizontal },
    { key = '-', mods = 'CTRL|ALT', action = wezterm.action.SplitVertical },
    { key = 'a', mods = 'CTRL|ALT', action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' }, },
{ key = '+', mods = 'ALT',     action = act.AdjustPaneSize({ 'Up', 1 }) },
      { key = '-', mods = 'ALT',     action = act.AdjustPaneSize({ 'Down', 1 }) },
      { key = '<', mods = 'ALT',     action = act.AdjustPaneSize({ 'Left', 1 }) },
      { key = '>', mods = 'ALT|SHIFT',     action = act.AdjustPaneSize({ 'Right', 1 }) },

    -- Zoom
    {key = 'm', mods = 'ALT',action = wezterm.action.TogglePaneZoomState },

    -- Search
    --{key = "f", mods = "ALT", action = wezterm.action({ Search = { CaseInSensitiveString = "" } })},
    --{ key = 'l', mods = 'ALT',    action = wezterm.action.ShowLauncher },

    -- Fuzy finders
    { key = 's', mods = 'ALT', action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
    { key = 'q', mods = 'ALT', action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|TABS' } },

    -- Close pane
    { key = 'c', mods = 'ALT', action = wezterm.action.CloseCurrentPane { confirm = false }, },

    -- Easy tab navigation
    { key = "1", mods = "ALT", action = wezterm.action({ ActivateTab = 0 })},
    { key = "2", mods = "ALT", action = wezterm.action({ ActivateTab = 1 })},
    { key = "3", mods = "ALT", action = wezterm.action({ ActivateTab = 2 })},
    { key = "4", mods = "ALT", action = wezterm.action({ ActivateTab = 3 })},
    { key = "5", mods = "ALT", action = wezterm.action({ ActivateTab = 4 })},

    -- Spawn Tab in default domain (Debian)
    { key = "t", mods = "ALT", action = wezterm.action.SpawnTab 'DefaultDomain'},

    -- Spawn Window
    { key = "Enter", mods = "ALT", action = "SpawnWindow" },

    -- Navigate Tab one at a time
    { key = "Tab", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 })},
    { key = "Tab", mods = "ALT|SHIFT", action = wezterm.action({ ActivateTabRelative = -1 })},

    -- Copy text
    { key = "c", mods = "SHIFT|CTRL", action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" })},

    -- Paste text
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" })},

    -- Create new workspace
    {
        key = 'w',
        mods = 'ALT',
        action = act.PromptInputLine {
            description = wezterm.format {
                { Attribute = { Intensity = 'Bold' } },
                { Foreground = { AnsiColor = 'Fuchsia' } },
                { Text = 'Enter name for new workspace' },
            },
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:perform_action(
                        act.SwitchToWorkspace {
                            name = line,
                        },
                        pane
                    )
                end
            end),
        },
    },

    -- Rename Tab
    {
        key = 'e',
        mods = 'ALT',
        action = act.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        },
    },
}

return Config
