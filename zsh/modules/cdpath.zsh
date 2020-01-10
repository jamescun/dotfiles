if [ -d "$HOME/projects/src" ]; then
	CDPATH=""

	for host in $HOME/projects/src/* ; do
		for project in $host/* ; do
			CDPATH=$CDPATH:$project
		done
	done

	export CDPATH=${CDPATH#:}
fi
