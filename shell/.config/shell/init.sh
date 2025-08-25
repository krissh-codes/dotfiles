# atuin :- command history
# fzf :- fuzzy finder
# zoxide :- cd powertool
# starship :- prompt

eval "$(atuin init zsh --disable-up-arrow)"
source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
