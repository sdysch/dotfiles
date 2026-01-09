#!/bin/bash
# bootstrap coder instance
DOTFILES_REPO="https://github.com/sdysch-flyr/dotfiles"
DOTFILES_INSTALLDIR="$HOME"
PACKAGE_INSTALLPATH="dotfiles/install_scripts/packages/install"

NVIM_VERSION="v0.11.5"
TREESITTER_VERSION="v0.26.3"

function _install_deps() {
	sudo apt-get -y update
	sudo apt-get install -y neovim tmux stow eza zsh direnv cmake cargo nodejs npm fzf
}

function _install_configs() {
	cd $DOTFILES_INSTALLDIR
	git clone --depth=1 $DOTFILES_REPO

	# symlink configs
	pushd dotfiles/setups
	stow --no-folding flyr --target=$HOME
	stow --no-folding common --target=$HOME
	popd
}

_install_fonts() {
	# tmp dir
	tmpdir=$(mktemp -d)
	git clone --depth=1 https://github.com/powerline/fonts.git "$tmpdir/fonts"
	pushd "$tmpdir/fonts"
	./install.sh
	popd > /dev/null
}

function _install_vim() {

	# pull requested version
	pushd /tmp
	curl -L -o nvim.appimage https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux-x86_64.appimage
	./nvim.appimage --appimage-extract
	sudo mv squashfs-root /opt/nvim
	sudo rm /usr/local/bin/nvim
	sudo ln -s /opt/nvim/usr/bin/nvim /usr/local/bin/nvim
	popd
}

function _install_zsh() {
	# first change shell to zsh
	# chsh -s /usr/bin/zsh
	sudo chsh -s $(which zsh)

	# install zsh plugins
	pushd $DOTFILES_INSTALLDIR
	echo "Installing zsh packages..."
	INSTALL=${XDG_DATA_HOME:-$HOME/.local/share}/zsh_plugins

	PLUGINS=(
		'https://github.com/zsh-users/zsh-autosuggestions'
		'https://github.com/zsh-users/zsh-syntax-highlighting.git'
		'https://github.com/romkatv/powerlevel10k.git'
		'https://github.com/rupa/z.git'
		'https://github.com/esc/conda-zsh-completion'
	)
	git clone https://github.com/zsh-users/zsh-autosuggestions $INSTALL/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $INSTALL/zsh-syntax-highlighting
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $INSTALL/powerlevel10k
	git clone https://github.com/rupa/z.git $INSTALL/z
	git clone https://github.com/esc/conda-zsh-completion $INSTALL/conda-zsh-completion

	for repo in "${PLUGINS[@]}"; do
		git clone $repo "$INSTALL/$(basename "$repo" .git)"
	done

	echo "Done"
	popd

	# reload configs
	echo "Logout and log back in"
}

function _install_tree_sitter() {
	# need a more up to date version of tree sitter than what is in apt
	pushd /tmp
	curl -L https://github.com/tree-sitter/tree-sitter/releases/download/$TREESITTER_VERSION/tree-sitter-linux-x64.gz | gunzip > tree-sitter
	chmod +x tree-sitter
	sudo mv tree-sitter /usr/local/bin/tree-sitter
	popd
}

# install packages that I use
_install_deps

# install and symlink configs
_install_configs

# terminal fonts
_install_fonts

# vim
_install_vim

# tree-sitter
_install_tree_sitter

# install zsh
_install_zsh
