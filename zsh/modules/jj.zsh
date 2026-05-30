# add support for Jujitsu git integration if installed.
if command_exists jj; then
	autoload -U compinit
	compinit
	source <(jj util completion zsh)
fi
