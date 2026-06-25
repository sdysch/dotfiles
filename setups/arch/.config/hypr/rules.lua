-- === Float defaults ===
hl.window_rule({
  name = "float-rules",
  float = true,
  fullscreen_state = "0 0",
  maximize = false,
  fullscreen = false,
})

-- === Floating windows ===

-- dialogs / popups / menus / notifications
hl.window_rule({
  match = { class = "^(.*dialog.*|.*popup.*|.*menu.*|.*notification.*)$" },
  float = true,
})

-- matplotlib
hl.window_rule({
  match = { class = "^(Matplotlib)$" },
  float = true,
})

-- pulseaudio (pavucontrol)
hl.window_rule({
  name = "pulseaudio-rules",
  match = { class = "^(org.pulseaudio.pavucontrol)$" },
  float = true,
  center = true,
})

-- network / bluetooth
hl.window_rule({
  match = { class = "^(blueman-manager|nm-connection-editor)$" },
  float = true,
})

-- sxiv
hl.window_rule({
  match = { class = "^(sxiv)$" },
  float = true,
})

-- file pickers
hl.window_rule({
  name = "float-file-pickers",
  match = { title = "^(Open File|Select a File|Choose wallpaper|Open Folder)(.)$" },
  float = true,
})

-- === Opacity rules ===

hl.window_rule({
  match = { class = "^(Alacritty|kitty)$" },
  opacity = "0.92 0.6",
})

hl.window_rule({
  match = { class = "^(spotify)$" },
  opacity = "0.96 0.90",
})

hl.window_rule({
  match = { class = "^(firefox|google-chrome)$" },
  opacity = "0.98 0.95",
})

hl.window_rule({
  match = { class = "^(org.gnome.Geary)$" },
  opacity = "0.96 0.90",
})

-- === Special workspaces ===

hl.window_rule({
  match = { class = "^(spotify)$" },
  workspace = "special:music",
})

hl.window_rule({
  match = { class = "^(org.gnome.Geary)$" },
  workspace = "special:scratch",
})

-- === Others ===

hl.window_rule({
  name = "dolphin-rules",
  match = { class = "^(org.kde.dolphin)$" },
  float = true,
  center = true,
  size = { 1100, 700 },
})

hl.window_rule({
  name = "spotify-rules",
  match = { class = "^(Spotify)$" },
  float = true,
  center = true,
  size = { 1100, 700 },
})

hl.window_rule({
  name = "ytpl-rules",
  match = { title = "^(ytpl)$" },
  float = true,
  center = true,
  size = { 1000, 700 },
})

hl.window_rule({
  name = "mpv-rules",
  match = { class = "^(mpv)$" },
  float = true,
  center = true,
  size = { 1280, 720 },
})

hl.window_rule({
  name = "geary-rules",
  match = { class = "^(org.gnome.Geary)$" },
  float = true,
  center = true,
  size = { 1100, 700 },
})

-- === Layer rules ===

hl.layer_rule({
  name = "waybar-rules",
  match = { namespace = "waybar" },
  blur = true,
  ignore_alpha = 0.0, -- fixed from 0.k
  animation = "slide",
})

hl.layer_rule({
  name = "rofi-rules",
  match = { namespace = "rofi" },
  blur = true,
  ignore_alpha = 0.15,
  animation = "popin 85%",
})
