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

ZSH="${XDG_DATA_HOME/:-~/.local/share/}/oh-my-zsh"
if [ -d $ZSH ]; then
	echo "oh-my-zsh already installed"
else
	echo "Installing oh-my-zsh"
	export RUNZSH="no"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
echo "Done"

echo "Installing zsh packages..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.local/share/oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.local/share/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.local/share/oh-my-zsh/themes/powerlevel10k
echo "Done"
