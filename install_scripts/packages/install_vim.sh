#!/bin/bash
echo "Installing and building neovim from source...." # it's better that way
pushd /tmp
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
popd

nvim +PlugInstall +qall
