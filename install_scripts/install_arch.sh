#!/usr/bin/env bash
set -Eeuo pipefail

# === helpers ===
is_ci() {
    [[ -n "${CI:-}" ]]
}

log() {
    printf '\n\033[1;34m==> %s\033[0m\n' "$1"
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
	log 'Installing powerline fonts'
	# tmp dir
	tmpdir=$(mktemp -d)
	git clone --depth=1 https://github.com/powerline/fonts.git "$tmpdir/fonts"
	pushd "$tmpdir/fonts"
	./install.sh
	popd > /dev/null
}

_change_shell_to_zsh() {
	log 'Changing shell'
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
	log 'Installing zsh plugins'
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
		'https://github.com/zsh-users/zsh-autosuggestions.git'
		'https://github.com/zsh-users/zsh-syntax-highlighting.git'
		'https://github.com/romkatv/powerlevel10k.git'
		'https://github.com/rupa/z.git'
		'https://github.com/esc/conda-zsh-completion.git'
		'https://github.com/MichaelAquilina/zsh-you-should-use.git'
	)

	for repo in "${PLUGINS[@]}"; do
		clone_if_missing "$repo" "$PLUGIN_DIR/$(basename "$repo" .git)"
	done

	log "Done"
}

_install_packages() {
	log 'Installing packages, pacman & AUR'
	if ! is_ci; then
		log 'Installing pacman packages'
		# shellcheck disable=SC2024
		sudo pacman -S --needed --noconfirm - < packages_arch.txt

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

_create_xdg_dirs() {
	log 'Creating XDG directories'
	mkdir -p \
		"${XDG_CONFIG_HOME:-$HOME/.config}" \
		"${XDG_DATA_HOME:-$HOME/.local/share}" \
		"${XDG_CACHE_HOME:-$HOME/.cache}" \
		"$HOME/.ssh"
}

_install_uv() {
	log 'Installing uv'
	curl -LsSf https://astral.sh/uv/install.sh | sh
}

_create_user_dirs() {
    log 'Creating user directories'
    mkdir -p \
        "$HOME/Documents" \
        "$HOME/Music" \
        "$HOME/Pictures/screenshots" \
        "$HOME/Videos" \
        "$HOME/Downloads" \
        "$HOME/.local/share/mail/gmail"
}

# ===================================================
#						MAIN
# ===================================================

_create_xdg_dirs
_install_packages
_install_fonts
_change_shell_to_zsh
_install_zsh
_install_uv
if ! is_ci; then
	_create_user_dirs
fi
log 'Bootstrap complete'
