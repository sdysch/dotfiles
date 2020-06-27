#!/bin/sh
function install() {
	echo "Installing $1 ...."
	sleep 1
	INSTALLDIR="$HOME/.local/share/suckless/$1"
	mkdir -p $INSTALLDIR
	git clone https://github.com/sdysch/$1.git $INSTALLDIR
	cd $INSTALLDIR
	sudo make install
}
install dmenu
install dwm
install slock
install dwmblocks
