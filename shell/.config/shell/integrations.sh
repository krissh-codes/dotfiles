export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border'
export FZF_CTRL_T_COMMAND="fd --follow --exclude tags --exclude .git --exclude node_modules . $dir 2>/dev/null"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'lsd --color always --icon always --tree --depth 1 {} | head -200'"
export BAT_THEME="OneHalfLight"
