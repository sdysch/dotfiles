#!/bin/bash
function install() {
	echo "Installing $1 ....."
	sleep 1
	INSTALLDIR="$HOME/Documents/repos/$1"
	mkdir -p $INSTALLDIR
	git clone https://github.com/sdysch/$1.git $INSTALLDIR
	pushd $INSTALLDIR
	sudo make install
	popd
}

install dmenu
install dwm
install st
install slock
install dwmblocks
