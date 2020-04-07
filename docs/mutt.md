# mutt installation instructions

* Clone mutt-wizard
```
git clone https://github.com/LukeSmithxyz/mutt-wizard
cd mutt-wizard
sudo make install
```

* Run `mw add` and setup account information
* Run `notmuch setup` to setup mail sorting
* Link muttrc config
* source this file in muttrc generated from mutt wizard

```
ln -fsn path/to/dotfiles/mutt/config.muttrc $HOME/.config/mutt/config.muttrc
ln -fsn path/to/dotfiles/mutt/signature $HOME/.config/mutt/signature
source /home/sdysch/.config/mutt/config.muttrc
```
