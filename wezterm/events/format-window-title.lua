local wezterm = require('wezterm')

local LEFT_ARROW = utf8.char(0xff0b3)
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

local COL_BG = "#eceff4"
local COL_BG_ALT = "#d8dee9"
local COL_FG = "#4c566a"
local COL_FG_ALT = "#5e81ac"
local COL_ACCENT = "#88c0d0"

function strip_home_name(text)
	local username = os.getenv("USER")
	clean_text = text:gsub("/home/" .. username, "~")
	return clean_text
end

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
	local zoomed = ""
	if tab.active_pane.is_zoomed then
		zoomed = "[Z] "
	end

	local index = ""
	if #tabs > 1 then
		index = string.format("[%d/%d] ", tab.tab_index + 1, #tabs)
	end

	local clean_title = strip_home_name(tab.active_pane.title)
	return zoomed .. index .. clean_title
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	-- edge icon
	local edge_background = COL_BG
	-- inactive tab
	local background = COL_BG_ALT
	local foreground = COL_FG

	if tab.is_active then
		background = COL_FG_ALT
		foreground = COL_BG
	elseif hover then
		background = COL_ACCENT
		foreground = COL_FG
	end

	local edge_foreground = background
    clean_title = strip_home_name(tab.active_pane.title)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = clean_title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)
