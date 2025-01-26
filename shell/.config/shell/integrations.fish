set -Ux FZF_DEFAULT_OPTS "--height 60% --layout=reverse --border"
set -Ux FZF_CTRL_T_COMMAND "fd --follow --exclude tags --exclude .git --exclude node_modules . $dir 2>/dev/null"
set -Ux FZF_CTRL_T_OPTS "--preview 'bat -n --color=always --line-range :500 {}'"
set -Ux FZF_ALT_C_OPTS "--preview 'lsd --color always --icon always --tree --depth 1 {} | head -200'"

set -x BAT_THEME "OneHalfLight"

set -Ux fifc_editor lvim
set -Ux fifc_exa_opts --icon always --color always --tree --depth 1
set -Ux fifc_keybinding \cx # ctrl x
