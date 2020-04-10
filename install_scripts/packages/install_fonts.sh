#!/bin/bash
echo "Installing powerline fonts..."
pwd=$(pwd)
cd /tmp
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
cd $pwd
rm -rf fonts
echo "Done"
