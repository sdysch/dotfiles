hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 20,
    border_size = 2,
    col = {
      active_border = { colors = { "rgba(88c0d0ee)", "rgba(5e81acee)" }, angle = 45 },
      inactive_border = "rgba(4c566aaa)",
    },
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

-- animations
local easeOutQuint = hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
local easeInOutCubic = hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
local linear = hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
local almostLinear = hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
local quick = hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- global toggle baseline
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })

-- borders
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "easeOutQuint" })

-- windows
hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "easeOutQuint" })

-- fade system
hl.animation({ leaf = "fade", enabled = true, speed = 8, bezier = "quick" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 6, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 6, bezier = "almostLinear" })

-- layers
hl.animation({ leaf = "layers", enabled = true, speed = 14, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 12, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 8, bezier = "linear", style = "fade" })

-- fade layers
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 8, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 6, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 6, bezier = "almostLinear" })

-- workspaces
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "easeInOutCubic", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 5, bezier = "easeInOutCubic", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 5, bezier = "easeInOutCubic", style = "slide" })
