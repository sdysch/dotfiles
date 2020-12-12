# zsh plugins
INSTALL=${XDG_DATA_HOME:-$HOME/.local/share}/zsh_plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $INSTALL/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $INSTALL/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $INSTALL/powerlevel10k
git clone https://github.com/rupa/z.git $INSTALL/z
