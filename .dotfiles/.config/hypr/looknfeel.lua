local border_active = "0xffc4a7e7"
local border_inactive = "0xff26233a"

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,
		["col.active_border"] = border_active,
		["col.inactive_border"] = border_inactive,
		resize_on_border = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 4,
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
		},

		blur = {
			enabled = false,
		},
	},

	animations = {
		enabled = false,
	},

	dwindle = {
		preserve_split = true,
		force_split = 2,
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		focus_on_activate = true,
	},

	cursor = {
		hide_on_key_press = true,
		warp_on_change_workspace = 1,
	},

	binds = {
		hide_special_on_workspace_change = true,
	},
})
