#!/bin/bash
# bootstrap coder instance
DOTFILES_REPO="https://github.com/sdysch-flyr/dotfiles"
DOTFILES_INSTALLDIR="$HOME"
PACKAGE_INSTALLPATH="dotfiles/install_scripts/packages/install"

NVIM_VERSION="v0.11.5"
TREESITTER_VERSION="v0.26.3"
RG_VERSION="15.1.0"

ZSH_PLUGIN_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zsh_plugins"

# have to install these to local as system wide doesn't necessarily persist after restart
NVIM_INSTALL_DIR="$HOME/.local/bin"
EZA_INSTALL_DIR="$HOME/.local/bin"
RG_INSTALL_DIR="$HOME/.local/bin"

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
    # sudo apt-get install -y nodejs npm golang-go bat
    sudo apt-get install -y bat
}

_install_configs() {
	log 'Installing dotfiles'
	if [[ -d "$DOTFILES_DIR/.git" ]]; then
		log 'Dotfiles already exist, skipping clone'
	else
		git clone --depth=1 "$DOTFILES_REPO" "$DOTFILES_INSTALLDIR"
	fi
	pushd "$DOTFILES_DIR/setups" >/dev/null
	stow --no-folding flyr --target="$HOME"
	stow --no-folding common --target="$HOME"
	popd >/dev/null
}

_install_fonts() {
	log 'Installing fonts'
	pushd "$DOTFILES_DIR" >/dev/null
	source "${PACKAGE_INSTALLPATH}_fonts.sh"
	popd >/dev/null
}

_install_vim() {

	log "Installing neovim $NVIM_VERSION"

	require_cmd curl

	tmpdir="$(mktemp -d)"
	pushd "$tmpdir" >/dev/null

	curl -L -o nvim.appimage https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux-x86_64.appimage
	chmod +x nvim.appimage
	./nvim.appimage --appimage-extract

	# sudo mv squashfs-root /opt/nvim
	# sudo ln -sf /opt/nvim/usr/bin/nvim $NVIM_INSTALL_DIR
	mv squashfs-root ~/.local/bin/nvim-app
	ln -s ~/.local/bin/nvim-app/usr/bin/nvim ~/.local/bin/nvim

	popd > /dev/null
	rm -rf "$tmpdir"
}

_change_shell_to_zsh() {
	
	log "Changing shell to zsh"
	# chsh -s /usr/bin/zsh
	# sudo chsh -s $(which zsh)
	sudo chsh -s $(which zsh) $USER

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
	pushd "$tmpdir" >/dev/null

	curl -L "https://github.com/tree-sitter/tree-sitter/releases/download/$TREESITTER_VERSION/tree-sitter-linux-x64.gz" | gunzip > tree-sitter
	chmod +x tree-sitter
	sudo mv tree-sitter /usr/local/bin/tree-sitter

	popd >/dev/null
	rm -rf "$tmpdir"
}

_install_eza() {
	log "Installing eza"
	require_cmd wget
	
	tmpdir="$(mktemp -d)"
	pushd "$tmpdir" >/dev/null

	wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
	mv eza $EZA_INSTALL_DIR

	popd >/dev/null
	rm -rf "$tmpdir"
}

_install_rg() {
	log "Install ripgrep"
	require_cmd curl

	tmpdir="$(mktemp -d)"
	pushd "$tmpdir" >/dev/null

	curl -L "https://github.com/BurntSushi/ripgrep/releases/download/$RG_VERSION/ripgrep-$RG_VERSION-aarch64-unknown-linux-gnu.tar.gz" | tar xz
	mv ripgrep-$RG_VERSION-aarch64-unknown-linux-gnu/rg $RG_INSTALL_DIR

	popd >/dev/null
	rm -rf "$tmpdir"
}

# ====================================================================================================
#											Main
# ====================================================================================================

_install_deps
_install_configs
_install_fonts
_install_vim
_install_tree_sitter
_install_zsh
_install_eza
_install_rg

log 'Bootstrap complete'
