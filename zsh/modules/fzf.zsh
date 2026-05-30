# add fzf fuzzy finder shell integration.
if command_exists fzf; then
	source <(fzf --zsh)
fi
