local wezterm = require("wezterm")
local act = wezterm.action

config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	-- default_cursor_style = "BlinkingBar",
	color_scheme = "tokyonight_night",
	font = wezterm.font("Maple Mono NF", { weight = "Bold" }),
	font_size = 12.5,

	-- Keybinds
	keys = {
		{ mods = "OPT", key = "LeftArrow", action = act.SendKey({ mods = "ALT", key = "b" }) },
		{ mods = "OPT", key = "RightArrow", action = act.SendKey({ mods = "ALT", key = "f" }) },
		{ mods = "CMD", key = "LeftArrow", action = act.SendKey({ mods = "CTRL", key = "a" }) },
		{ mods = "CMD", key = "RightArrow", action = act.SendKey({ mods = "CTRL", key = "e" }) },
		{ mods = "CMD", key = "Backspace", action = act.SendKey({ mods = "CTRL", key = "u" }) },
		{ mods = "CMD|OPT", key = "LeftArrow", action = act.ActivateTabRelative(-1) },
		{ mods = "CMD|OPT", key = "RightArrow", action = act.ActivateTabRelative(1) },
		{ mods = "CMD|SHIFT", key = "LeftArrow", action = act.ActivateTabRelative(-1) },
		{ mods = "CMD|SHIFT", key = "RightArrow", action = act.ActivateTabRelative(1) },
	},
}

return config
