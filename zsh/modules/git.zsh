if command_exists git; then
	alias gco="git checkout"
	alias ga="git add"
	alias gs="git status -s"
	alias gf="git fetch"
	alias gpl="git pull"
	alias gps="git push"
	alias gcs="git commit -S -m"

	if [ -d "$HOME/.radicle" ]; then
		export PATH=$PATH:$HOME/.radicle/bin
	fi
fi
