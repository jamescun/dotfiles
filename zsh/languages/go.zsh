if command_exists go; then
	# set $GOPATH use $HOME/.cache/go for dependency installation.
	export GOPATH=$HOME/.cache/go

	# add binaries built with go to $PATH.
	export PATH=$PATH:$HOME/.cache/go/bin

	# configure $GOPRIVATE to prevent using the module proxy.
	export GOPRIVATE=$GOPRIVATE:github.com/jamescun/*
fi
