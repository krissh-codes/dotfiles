
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# Q pre block. Keep at the top of this file.

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# bun completions
# [ -s "/Users/krishna-13961/.bun/_bun" ] && source "/Users/krishna-13961/.bun/_bun"

# source ~/.config/shell/oh-my-zsh.sh
source ~/.config/shell/environment.sh
source ~/.config/shell/init.sh
source ~/.config/shell/aliases.sh
source ~/.config/shell/integrations.sh
source ~/.config/shell/plugins.zsh

alias grunt='./node_modules/grunt-cli/bin/grunt'

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
