# make directory, then change to it
ck () {
	if mkdir $1; then
		cd $1
	fi
}
