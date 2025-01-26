# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.pre.bash"

source  ~/.config/shell/environment.sh

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

source ~/.config/shell/aliases.sh
source ~/.config/shell/variables.sh
source ~/.config/shell/functions.sh

eval "$(/opt/homebrew/bin/brew shellenv)"

export ZERO_HELPER_STATUS=OFF
export GPG_TTY=`tty`

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bash_profile.post.bash"
