# add project directories to $CDPATH.
if [ -d "$PROJECTS" ]; then
	# default $CDPATH for projects is `<organization>/<project>`.
	export CDPATH=$PROJECTS:$CDPATH

	# trim trailing colon from $CDPATH, if any.
	export CDPATH=${CDPATH%:}
fi
