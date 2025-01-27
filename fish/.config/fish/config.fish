source ~/.config/shell/environment.fish

if status --is-interactive
	source ~/.config/shell/aliases.sh
	source ~/.config/shell/variables.fish
	source ~/.config/shell/functions.fish

	source ~/.config/shell/init.fish
	source ~/.config/shell/integrations.fish
end

if status --is-login
end
