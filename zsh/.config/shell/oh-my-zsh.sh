# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh
