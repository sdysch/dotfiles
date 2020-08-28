# === oh-my-zsh related ===
# theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# plugins
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	z
)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# common aliases
source $HOME/.zsh_aliases_common
source $HOME/.zsh_aliases

# change colour of wildcard
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold

compinit -d $HOME/.cache/zsh/zcompdump-$ZSH_VERSION
