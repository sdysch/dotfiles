#!/bin/bash
# bootstrap vm
DOTFILES_REPO="https://github.com/sdysch-mbsb/dotfiles"
DOTFILES_DIR="$HOME/dotfiles/"
PACKAGE_INSTALLPATH="dotfiles/install_scripts/packages/install"

NVIM_VERSION="v0.12.6"
TREESITTER_VERSION="v0.26.3"

ZSH_PLUGIN_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zsh_plugins"

# === helpers ===
log() {
    printf '\n\033[1;34m==> %s\033[0m\n' "$1"
}

require_cmd() {
    command -v "$1" >/dev/null 2>&1 || {
        echo "Missing required command: $1" >&2
        exit 1
    }
}

_install_deps() {
    log 'Installing system dependencies'
    sudo apt-get update -y
    sudo apt-get install -y \
	    bat \
	    btop \
	    curl \
	    direnv \
	    eza \
	    fzf \
	    gh \
	    kitty \
	    lazygit \
	    msodbcsql18 \
	    neovim \
	    nodejs \
	    npm \
	    ripgrep \
	    stow \
	    tmux \
	    unixodbc \
	    unixodbc-dev \
	    zsh
}

_install_configs() {
	log 'Installing dotfiles'
	if [[ -d "$DOTFILES_DIR/.git" ]]; then
		log 'Dotfiles already exist, skipping clone'
	else
		git clone --depth=1 "$DOTFILES_REPO" "$DOTFILES_DIR"
	fi
	pushd "$DOTFILES_DIR/setups" >/dev/null || exit
	stow --no-folding mbsb --target="$HOME"
	stow --no-folding common --target="$HOME"
	popd >/dev/null || exit
}

_install_fonts() {
	log 'Installing fonts'
	pushd "$DOTFILES_DIR" >/dev/null || exit
	# shellcheck disable=SC1090
	source "${PACKAGE_INSTALLPATH}_fonts.sh"
	popd >/dev/null || exit
}

_change_shell_to_zsh() {
	
	log "Changing shell to zsh"
	# chsh -s /usr/bin/zsh
	# sudo chsh -s $(which zsh)
	sudo chsh -s "$(which zsh)" "$USER"

}

_install_zsh() {

	log 'Configuring zsh'

	mkdir -p "$ZSH_PLUGIN_DIR"

	log 'Installing zsh plugins'
	git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGIN_DIR/zsh-autosuggestions" || true
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting" || true
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_PLUGIN_DIR/powerlevel10k" || true
	git clone https://github.com/rupa/z.git "$ZSH_PLUGIN_DIR/z" || true
	git clone https://github.com/esc/conda-zsh-completion "$ZSH_PLUGIN_DIR/conda-zsh-completion" || true
	git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$ZSH_PLUGIN_DIR/zsh-you-should-use" || true
}

_install_tree_sitter() {
	log "Installing tree-sitter $TREESITTER_VERSION"

	require_cmd curl
	tmpdir="$(mktemp -d)"
	pushd "$tmpdir" >/dev/null || exit 1

	curl -L "https://github.com/tree-sitter/tree-sitter/releases/download/$TREESITTER_VERSION/tree-sitter-linux-x64.gz" | gunzip > tree-sitter
	chmod +x tree-sitter
	sudo mv tree-sitter /usr/local/bin/tree-sitter

	popd >/dev/null || exit 1
	rm -rf "$tmpdir"
}

_install_uv() {
	log "Installing uv"
	require_cmd curl
	curl -LsSf https://astral.sh/uv/install.sh | sh
}

_install_starship() {
	log "Install starship"
	require_cmd curl

	curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -y
}

_install_pre_commit() {
	log "Install pre-commit"
	require_cmd uv

	uv tool install pre-commit

	log "Setup pre-commit, enable in repos"
}

_install_vim() {

	log "Installing neovim $NVIM_VERSION"

	require_cmd curl

	tmpdir="$(mktemp -d)"
	pushd "$tmpdir" >/dev/null || exit 1

	curl -L -o nvim.appimage https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux-x86_64.appimage
	chmod +x nvim.appimage
	./nvim.appimage --appimage-extract

	mv squashfs-root ~/.local/bin/nvim-app
	ln -s ~/.local/bin/nvim-app/usr/bin/nvim ~/.local/bin/nvim

	popd > /dev/null || exit 1
	rm -rf "$tmpdir"
}

# ====================================================================================================
#					Main
# ====================================================================================================

_install_deps
_install_configs
_install_fonts
_install_vim
_install_tree_sitter
_change_shell_to_zsh
_install_zsh
_install_uv
_install_starship
_install_pre_commit

# make directories
mkdir -p "${XDG_DATA_HOME-$HOME/.local/share}"/zsh

log 'Bootstrap complete'
