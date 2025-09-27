# Q pre block. Keep at the top of this file.
# export Q_IS_LOGIN_SHELL=1
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh"

# Added by Toolbox App
export PATH="$PATH:/Users/krishna-13961/Library/Application Support/JetBrains/Toolbox/scripts"

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh"
