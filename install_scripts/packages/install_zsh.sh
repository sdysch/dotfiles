#!/bin/bash

# make directories needed for cache files
mkdir -p ${XDG_DATA_HOME:-$HOME/.local/share}/zsh
mkdir -p ${XDG_CACHE_HOME:-$HOME/.cache}/zsh


if [[ "$SHELL" =~ .*zsh$ ]]; then
	echo "ZSH is the current shell"
else
	echo "Changing shell from ${SHELL} to zsh"
	chsh -s "$(which zsh)" "$USER"
	echo -e "Please log out and log back in to apply shell changes, then rerun install_zsh.sh"
fi

echo "Installing zsh packages..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.local/share/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.local/share/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.local/share/powerlevel10k
echo "Done"
