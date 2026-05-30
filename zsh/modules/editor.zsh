# if VSCode code helper is installed, use that as the default editor.
if command_exists code; then
	export EDITOR="code -n -w"
	export KUBE_EDITOR="code -n -w"
else
	export EDITOR="vim"
fi
