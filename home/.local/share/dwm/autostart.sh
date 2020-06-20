#!/bin/bash

# dwm autostart programs
nm-applet
compton -b --config ~/.config/compton/compton.conf
pulseaudio --start
~/.local/bin/check_inactivity
nitrogen --restore
gnome-keyring-daemon --start
