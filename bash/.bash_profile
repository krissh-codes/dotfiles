# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.pre.bash"
# Q pre block. Keep at the top of this file.
source ~/.config/shell/environment.sh
source ~/.config/shell/aliases.sh

export ZERO_HELPER_STATUS=OFF
export GPG_TTY=$(tty)

# Q post block. Keep at the bottom of this file.
function csslint() {
  local OPTIND f option command
  command="stylelint"
  while getopts ":f:" option; do
    case $option in
    f)
      if [[ "$OPTARG" == "html" ]]; then
        command+=" --custom-formatter ~/.csslint/stylelint-html-formatter.js"
      fi
      ;;
    esac
    shift $(($OPTIND - 1))
  done
  numargs=$#
  for ((i = 1; i <= numargs; i++)); do
    if [[ "$1" != "-f" && "$1" != "html" ]]; then
      command+=" $1"
    fi
    shift
  done
  eval "$command"
}

alias grunt='./node_modules/grunt-cli/bin/grunt'
. "$HOME/.cargo/env"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.post.bash"
