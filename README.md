# dotfiles_harmonised

[![pipeline status](https://gitlab.com/sdish/dotfiles_harmonised/badges/master/pipeline.svg)](https://gitlab.com/sdish/dotfiles_harmonised/-/commits/master)

## My dotfiles
 * If you are reading this, then I probably wouldn't bother or waste your time. This is just a store for the various configuration files that I use, across the machines that I work on.
 * That being said, if you wish to steal anything, (as I undoubtedly have), then please be my guest!

![shell](figures/screenshot.png)

## Setup
* OS: [xubuntu](https://xubuntu.org/) 19.10 (xfce)
	* Trouble setting up wireless drivers. See https://askubuntu.com/questions/1218141/dell-vostro-5490-no-wifi-in-ubuntu-18-04
	* Script in .local/bin/restorewifi to fix
* Window manager: i3wm (+gaps) alongside xfce desktop environment
* zsh + [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
* vim + [Vundle](https://github.com/VundleVim/Vundle.vim)
* bash dotfiles for legacy purposes only

## Installation
* Installation instructions can be found [here](docs/install.md)
* Installation with gnu stow
* For home, clone repo to ~/dotfiles_harmonised then:
```
cd ~/dotfiles_harmonised
source install_scripts/install_packages.sh
cd home
stow home
```


* Mirror [here](https://github.com/sdysch/dotfiles)
