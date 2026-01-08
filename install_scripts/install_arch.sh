#!/usr/bin/env bash
set -Eeuo pipefail

# === helpers ===
is_ci() {
    [[ -n '${CI:-}' ]]
}

log() {
    printf '[+] %s\n' '$1'
}

# === XDG directory spec ===
log 'Creating XDG directories'
mkdir -p \
    '${XDG_CONFIG_HOME:-$HOME/.config}' \
    '${XDG_DATA_HOME:-$HOME/.local/share}' \
    '${XDG_CACHE_HOME:-$HOME/.cache}' \
    '$HOME/.ssh'

# === install packages (non-CI) ===
if ! is_ci; then
    log 'Installing pacman packages'
    sudo pacman -S --needed --noconfirm - < packages_arch.txt

    log 'Enabling cron'
    sudo systemctl enable cronie.service
    crontab crontab/crontab_arch

	# === AUR ===
	if ! command -v yay >/dev/null 2>&1; then
        log 'Installing yay'
        tmpdir=$(mktemp -d)
        git clone https://aur.archlinux.org/yay-git.git '$tmpdir/yay-git'
        (
            cd '$tmpdir/yay-git'
            makepkg -si --noconfirm
        )
        rm -rf '$tmpdir'
    fi

    log 'Installing AUR packages'
    yay -S --needed --noconfirm - < packages_AUR.txt
fi


scripts=(fonts zsh)
for script in ${scripts[@]}; do
	source install_scripts/packages/"install_${script}.sh"
done

# === enable login manager ===
if ! is_ci; then
    log 'Enabling LightDM'
    sudo systemctl enable lightdm.service
fi

# === user directories ===
if ! is_ci; then
    log 'Creating user directories'
    mkdir -p \
        '$HOME/Documents' \
        '$HOME/Music' \
        '$HOME/Pictures/screenshots' \
        '$HOME/Videos' \
        '$HOME/Downloads'
fi

log 'Bootstrap complete'
