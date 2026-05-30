hl.monitor({
  output = "eDP-1",
  mode = "1920x1080@144",
  position = "0x0",
  scale = 1.2,
})

hl.monitor({
  output = "HDMI-1",
  mode = "1920x1080@144",
  position = "1920x0",
  scale = 1,
})

-- unscale XWayland
hl.config({
  xwayland = {
    force_zero_scaling = true,
  },
})
