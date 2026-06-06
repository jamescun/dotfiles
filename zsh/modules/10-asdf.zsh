# add support for asdf version manager if installed
if command_exists asdf; then
	export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
	export PATH="$ASDF_DATA_DIR/shims:$PATH"

	# load asdf shell completions if they exist.
	if [ -d "$ASDF_DATA_DIR/completions" ]; then
		fpath=($ASDF_DATA_DIR/completions $fpath)
		autoload -Uz compinit && compinit
	fi
fi 
