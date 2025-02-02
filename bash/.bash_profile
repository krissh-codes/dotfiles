# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.pre.bash"

source ~/.config/shell/environment.sh
source ~/.config/shell/aliases.sh
source ~/.config/shell/variables.sh
source ~/.config/shell/functions.sh

eval "$(/opt/homebrew/bin/brew shellenv)"

export ZERO_HELPER_STATUS=OFF
export GPG_TTY=`tty`

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.post.bash"
