#!/bin/bash
function install() {
	echo "Installing $1 ....."
	sleep 1
	INSTALLDIR="$HOME/Documents/repos/$1"
	mkdir -p $INSTALLDIR
	git clone git@github.com:sdysch/$1.git $INSTALLDIR
	cd $INSTALLDIR/$1
	sudo make install
}

install dmenu
install dwm
install st
install slock
