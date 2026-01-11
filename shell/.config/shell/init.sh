# atuin :- command history
# fzf :- fuzzy finder
# zoxide :- cd powertool
# starship :- prompt

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(atuin init zsh --disable-up-arrow)"
source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
