# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Q pre block. Keep at the top of this file.
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH

export LDFLAGS="-L/opt/homebrew/opt/postgresql@9.5/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@9.5/include"

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
eval "$(starship init zsh)"

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# bun completions
# [ -s "/Users/krishna-13961/.bun/_bun" ] && source "/Users/krishna-13961/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# atuin :- command history
# fzf :- fuzzy finder
# zoxide :- cd powertool
eval "$(atuin init zsh --disable-up-arrow)"
source <(fzf --zsh)
eval "$(zoxide init zsh)"

export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border'
export FZF_CTRL_T_COMMAND="fd --follow --exclude tags --exclude .git --exclude node_modules . $dir 2>/dev/null"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'lsd --color always --icon always --tree --depth 1 {} | head -200'"

export BAT_THEME="OneHalfLight"

# [[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

alias grunt='./node_modules/grunt-cli/bin/grunt'

# replace ls with lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
