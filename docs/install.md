## Installation
* Installation instructions can be found [here](docs/install.md)
* I am working on a script, when I get time, to install

# zsh and oh-my-zsh
* Change shell to zsh
```
chsh -s /bin/zsh $(whoami)
```
* Logout and log back in
* Install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
* powerline theme
```
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```
* powerline fonts
```
git clone https://github.com/powerline/fonts.git --depth=1
cd /fonts
./install.sh
cd ..
rm -rf fonts
```

* zsh packages
```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

# vim
* Vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

# tmux
* themes
```
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
```

# i3
* [Installation instructions](docs/i3.md)
