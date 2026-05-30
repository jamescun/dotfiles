# use Node versions installed by nvm.
if command_exists nvm; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/homebrew/opt/nvm/nvm.sh"
	[  -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
fi
