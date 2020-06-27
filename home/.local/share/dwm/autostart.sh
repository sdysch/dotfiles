#!/bin/bash
# dwm autostart programs
compton -b --config ~/.config/compton/compton.conf &
dunst &
dwmblocks &
nitrogen --restore &
nm-applet &
#pulseaudio --start &
~/.local/bin/check_inactivity &
gnome-keyring-daemon --start &
# turn off the really annoying beep
xset -b
