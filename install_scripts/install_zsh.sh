#!/bin/bash

if [[ "$SHELL" =~ .*zsh$ ]]; then
	echo "ZSH is the current shell"
else
	echo "Changing shell from ${SHELL} to zsh"
	chsh -s "$(which zsh)" "$USER"
	echo -e "Please log out and log back in to apply shell changes, then rerun install_zsh.sh"
	exit 1
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
	echo "oh-my-zsh already installed"
else
	echo "Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
echo "Done"

echo "Installing zsh packages..."
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "Done"
