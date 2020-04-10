#!/bin/bash

echo "cloning taskwarrior"
git clone https://github.com/sdysch/taskwarrior_backups.git $HOME/.task/

echo "Installing packages"
source install_scripts/packages/install_packages.sh

# install crontab
cat crontab/crontab | crontab -
