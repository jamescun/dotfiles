if command_exists go; then
	# use $HOME/go for dependencies, $HOME/projects for code.
	export GOPATH=$HOME/go:$PROJECTS

	# add binaries built with go to $PATH.
	export PATH=$PATH:$PROJECTS/bin:$HOME/go/bin

	# add personal projects $GOPRIVATE to prevent using the module proxy.
	for org in $PROJECTS/src/*/* ; do
		# trim path to make import path.
		import_path=${org#"$PROJECTS/src/"}

		export GOPRIVATE=$GOPRIVATE:$import_path/*
	done

	# trim leading colon from $GOPRIVATE.
	export GOPRIVATE=${GOPRIVATE#:}
fi
