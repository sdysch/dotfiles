#!/usr/bin/env bash
set -Eeuo pipefail

# === helpers ===
is_ci() {
    [[ -n "${CI:-}" ]]
}

log() {
    printf "[+] %s\n" "$1"
}

clone_if_missing() {
	local repo="$1"
	local dest="$2"

	if [[ -d "$dest" ]]; then
		log "Already installed: $(basename "$dest")"
	else
		log "Cloning $(basename "$dest")"
		git clone --depth=1 "$repo" "$dest"
	fi
}

_install_fonts() {
	# tmp dir
	tmpdir=$(mktemp -d)
	git clone --depth=1 https://github.com/powerline/fonts.git "$tmpdir/fonts"
	pushd "$tmpdir/fonts"
	./install.sh
	popd > /dev/null
}

_change_shell_to_zsh() {
	if [[ "${SHELL:-}" == *zsh ]]; then
		log "zsh is already the current shell"
	else
		if ! is_ci; then
			if ! command -v zsh >/dev/null 2>&1; then
				log "ERROR: zsh is not installed"
				exit 1
			fi

			log "Changing shell to zsh"
			chsh -s "$(command -v zsh)"
			log "Please log out and log back in to apply shell changes"
			log "Then rerun this script"
		else
			log "CI detected; skipping shell change"
		fi
	fi
}

_install_zsh() {
	DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
	CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

	ZSH_DATA_DIR="$DATA_HOME/zsh"
	ZSH_CACHE_DIR="$CACHE_HOME/zsh"
	PLUGIN_DIR="$DATA_HOME/zsh_plugins"

	log "Creating directories"
	mkdir -p "$ZSH_DATA_DIR" "$ZSH_CACHE_DIR" "$PLUGIN_DIR"

	# === plugins ===
	log "Installing zsh plugins"

	PLUGINS=(
		'https://github.com/zsh-users/zsh-autosuggestions'
		'https://github.com/zsh-users/zsh-syntax-highlighting.git'
		'https://github.com/romkatv/powerlevel10k.git'
		'https://github.com/rupa/z.git'
		'https://github.com/esc/conda-zsh-completion'
	)

	for repo in "${PLUGINS[@]}"; do
		clone_if_missing "$repo" "$PLUGIN_DIR/$(basename "$repo" .git)"
	done

	log "Done"
}

_install_packages() {
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
			git clone https://aur.archlinux.org/yay-git.git "$tmpdir/yay-git"
			(
				cd "$tmpdir/yay-git"
				makepkg -si --noconfirm
			)
			rm -rf "$tmpdir"
		fi

		log 'Installing AUR packages'
		yay -S --needed --noconfirm - < packages_AUR.txt
	fi
}

# ===================================================
#						MAIN
# ===================================================

# === XDG directory spec ===
log 'Creating XDG directories'
mkdir -p \
    "${XDG_CONFIG_HOME:-$HOME/.config}" \
    "${XDG_DATA_HOME:-$HOME/.local/share}" \
    "${XDG_CACHE_HOME:-$HOME/.cache}" \
    "$HOME/.ssh"

# === install packages (non-CI) ===
log 'Installing packages, pacman & AUR'
_install_packages

# === install powerline fonts ===
log 'Installing powerline fonts'
_install_fonts

# === install zsh ===
log 'Changing shell'
_change_shell_to_zsh
log 'Installing zsh plugins'
_install_zsh

# === enable login manager ===
if ! is_ci; then
    log 'Enabling LightDM'
    sudo systemctl enable lightdm.service
fi

# === user directories ===
if ! is_ci; then
    log 'Creating user directories'
    mkdir -p \
        "$HOME/Documents" \
        "$HOME/Music" \
        "$HOME/Pictures/screenshots" \
        "$HOME/Videos" \
        "$HOME/Downloads"
fi

log 'Bootstrap complete'
