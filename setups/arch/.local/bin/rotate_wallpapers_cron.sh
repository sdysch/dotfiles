#!/usr/bin/env bash

# Ensure cron has a PATH
export PATH="$HOME/.local/bin:/usr/bin:/bin"

# Set Wayland session variables
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export HYPRLAND_INSTANCE_SIGNATURE=$(cat "$HOME/.cache/hyprland_sig")

# Directory with wallpapers
WALLPAPER_DIR="$HOME/dotfiles/wallpapers/current_rotation"
WALLPAPERS=("$WALLPAPER_DIR"/*)

# Pick one at random
RANDOM_WALLPAPER="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"

# Make sure hyprpaper is running
pgrep hyprpaper > /dev/null || (hyprpaper & disown; sleep 0.2)

# Apply wallpaper to all monitors
for MON in $(hyprctl monitors -j | jq -r '.[].name'); do
    hyprctl hyprpaper wallpaper "$MON,$RANDOM_WALLPAPER"
done
