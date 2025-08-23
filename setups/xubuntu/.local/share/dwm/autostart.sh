#!/bin/bash

# dwm autostart programs (consider adding to customised xinitrc in the future?)
picom -b --config ~/.config/compton/compton.conf &
dwmblocks &
gnome-keyring-daemon --start &
nitrogen --restore &
nm-applet &
pulseaudio --start &
#skypeforlinux &
~/.local/bin/check_inactivity &
dunst &
xfce4-power-manager
