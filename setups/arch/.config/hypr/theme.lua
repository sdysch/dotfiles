return {
	hl.config({
		general = {
			gaps_in = 5,
			gaps_out = 20,
			border_size = 2,
			-- col.active_border = { colors={ "rgba(88c0d0ee)", "rgba(5e81acee)" }, angle = 45 },
			-- col.inactive_border = {"rgba(4c566aaa)"},
			resize_on_border = false,
			allow_tearing = false,
			layout = "master",
		},
		decoration = {
			rounding = 12,
			rounding_power = 2,
			active_opacity = 0.96,
			inactive_opacity = 0.90,
			shadow = {
				enabled = true,
				range = 20,
				render_power = 3,
				color = "rgba(2e344055)",
			},
			blur = {
				enabled = true,
				size = 6,
				passes = 3,
				vibrancy = 0.12,
				new_optimizations = true,
			},
		},
		misc = {
			force_default_wallpaper = 1,
			disable_hyprland_logo = true,
		},
		master = {
			new_status = "master",
			mfact = 0.55,
			special_scale_factor = 0.9,
		},
		animations = {
			enabled = true,
		},
	})
}
