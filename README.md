# dotfiles_harmonised

## My dotfiles
 * If you are reading this, then I probably wouldn't bother or waste your time. This is just a store for the various configuration files that I use, across the machines that I work on.
 * That being said, if you wish to steal anything, (as I undoubtedly have), then please be my guest!

## Setup
* OS: [xubuntu](https://xubuntu.org/) 19.10 (xfce)
	* Trouble setting up wireless drivers. See https://askubuntu.com/questions/1218141/dell-vostro-5490-no-wifi-in-ubuntu-18-04
* Window manager: i3wm (+gaps) alongside xfce desktop environment
* zsh + [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
* vim + [Vundle](https://github.com/VundleVim/Vundle.vim)
* bash dotfiles for legacy purposes only

![shell](figures/screenshot.png)

## Installation

# zsh and oh-my-zsh
* Change shell to zsh
```chsh -s /bin/zsh $(whoami)
```
* Logout and log back in
* Install oh-my-zsh
```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
* powerline fonts
```git clone https://github.com/powerline/fonts.git --depth=1
cd /fonts
./install.sh
cd ..
rm -rf fonts
```

* zsh packages
```git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

# vim
* Vundle
```git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

# tmux
* themes
```git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
```

# i3
* [Installation instructions](i3/README.md)
