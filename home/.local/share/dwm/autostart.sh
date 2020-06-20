#!/bin/bash

# dwm autostart programs (consider adding to customised xinitrc in the future?)
compton -b --config ~/.config/compton/compton.conf &
gnome-keyring-daemon --start &
nitrogen --restore &
nm-applet &
pulseaudio --start &
skypeforlinux &
~/.local/bin/check_inactivity &
