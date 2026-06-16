local config = require("config")
local mainMod = "SUPER"

hl.bind(mainMod .. " + " .. "Return", hl.dsp.exec_cmd(config.terminal))
hl.bind(mainMod .. " + " .. "Q", hl.dsp.window.close())
hl.bind(mainMod .. " + " .. "E", hl.dsp.exec_cmd(config.fileManager))
hl.bind(mainMod .. " + " .. "V", hl.dsp.window.float())
hl.bind(mainMod .. " + " .. "D", hl.dsp.exec_cmd(config.menu))
-- bind = $mainMod SHIFT, J, togglesplit, # dwindle
hl.bind(mainMod .. " + " .. "F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + " .. "t", hl.dsp.group.toggle())

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + " .. "H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. "L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + " .. "K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. "J", hl.dsp.focus({ direction = "down" }))

-- Swap focused window with master
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "Return", hl.dsp.layout("swapwithmaster master"))

-- Switch workspaces with mainMod + [0-9], send active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Special workspaces
hl.bind(mainMod .. " + " .. "Z", hl.dsp.workspace.toggle_special("music"))
hl.bind(mainMod .. " + " .. "SPACE", hl.dsp.workspace.toggle_special("scratch"))

hl.bind(
  mainMod .. " + " .. "SHIFT" .. " + " .. "Z",
  hl.dsp.window.move({ workspace = "special:music" }, { follow = false })
)
hl.bind(
  mainMod .. " + " .. "SHIFT" .. " + " .. "SPACE",
  hl.dsp.window.move({ workspace = "special:scratch" }, { follow = false })
)

-- swap focussed windows left and right
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "h", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "l", hl.dsp.window.swap({ direction = "right" }))

-- custom programs
hl.bind(mainMod .. " + " .. "W", hl.dsp.exec_cmd(config.browser))
hl.bind(mainMod .. " + " .. "D", hl.dsp.exec_cmd(config.menu))
hl.bind(mainMod .. " + " .. "S", hl.dsp.exec_cmd("spotify-launcher"))
hl.bind(mainMod .. " + " .. "N", hl.dsp.exec_cmd(config.terminal .. " -e newsboat"))
hl.bind(mainMod .. " + " .. "G", hl.dsp.exec_cmd("geary"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- screenshots
hl.bind("Print", hl.dsp.exec_cmd("screenshot"))
hl.bind(mainMod .. " + " .. "Print", hl.dsp.exec_cmd("screenshot -s"))

-- notifications
-- hl.bind("CTRL" .. " + " .. "SPACE", hl.dsp.exec_cmd("dunstctl close"))
hl.bind("CTRL" .. " + " .. "SPACE", hl.dsp.exec_cmd("swaync-client --close-latest"))
hl.bind("CTRL" .. " + SHIFT + " .. "SPACE", hl.dsp.exec_cmd("swaync-client -t"))

-- power, lock options
hl.bind(mainMod .. " + " .. "X", hl.dsp.exec_cmd("lock_sway"))
hl.bind(mainMod .. " + " .. "U", hl.dsp.exec_cmd("poweroptions -r"))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@  +5%"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@  -5%"), { locked = true })
hl.bind(mainMod .. " + " .. "equal", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@  +5%"))
hl.bind(mainMod .. " + " .. "minus", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@  -5%"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@  toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { locked = true })
hl.bind(mainMod .. " + " .. "M", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@  toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true })

-- music
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "M", hl.dsp.exec_cmd("music_picker"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "P", hl.dsp.exec_cmd("rofi_playerctl"))

-- playing yt videos with mpv
hl.bind(mainMod .. " + " .. "Y", hl.dsp.exec_cmd("rofi_mpv_yt"))

-- playing yt playlists with mpv
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "Y", hl.dsp.exec_cmd("rofi_mpv_yt --playlist"))

-- cheat sheets
hl.bind(mainMod .. " + " .. "C", hl.dsp.exec_cmd("cht-rofi"))

-- character selection
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "d", hl.dsp.exec_cmd("choose_danish_characters -r"))
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "e", hl.dsp.exec_cmd("choose_emoji -r"))

-- passwords
hl.bind(mainMod .. " + " .. "P", hl.dsp.exec_cmd("copy_password -r"))

-- search bindings
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.exec_cmd("search_bindings"))
