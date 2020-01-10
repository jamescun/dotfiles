export GPG_TTY=$(tty)

# import dynamic configuration
for module in $DOTFILES/zsh/{functions,modules,languages}/*.zsh ; do
	source $module
done

# import system-specific secrets
if [ -e "$HOME/.secrets" ]; then
	source "$HOME/.secrets"
fi

