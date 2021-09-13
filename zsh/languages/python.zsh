if command_exists python; then
	alias py="python -B"
fi

if command_exists python3; then
	alias py3="python3 -B"
fi

if [ -d "$HOME/.pyenv" ]; then
	eval "$(pyenv init --path)"
	eval "$(pyenv virtualenv-init -)"
fi
