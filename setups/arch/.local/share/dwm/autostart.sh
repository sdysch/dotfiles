#!/bin/sh

dwmblocks &
nitrogen --restore &
nm-applet &
pulseaudio --start &
~/.local/bin/check_inactivity &
