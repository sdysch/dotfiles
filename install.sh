#====================
# vim
#====================

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#====================
# tmux
#====================

# themes
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack

#====================
# zsh specific
#====================

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#ZSH_CUSTOM="~/.oh-my-zsh/custom"

# powerline fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#====================
# xfce themes
#====================
if [ "$1" == "install-themes" ]; then
	mkdir -p ~/.themes && git clone https://github.com/EliverLara/Ant-Dracula.git ~/.themes
fi
