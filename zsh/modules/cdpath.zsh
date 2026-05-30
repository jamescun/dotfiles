# add project directories to $CDPATH.
if [ -d "$PROJECTS/src" ]; then
	for project in $PROJECTS/src/*/* ; do
		export CDPATH=$CDPATH:$project
	done

	# trim trailing colon from $CDPATH.
	export CDPATH=${CDPATH#:}
fi
