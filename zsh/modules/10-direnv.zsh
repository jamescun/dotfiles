# add support for direnv in projects.
if command_exists direnv; then
	eval "$(direnv hook zsh)"
fi
