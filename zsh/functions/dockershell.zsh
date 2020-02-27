# dockershell creates an interactive shell session inside a docker container,
# with the current working directory volume mounted.
#
# By default, a ubuntu:18.04 container is used. The first argument may be
# another container image to use.
dockershell() {
	local image="ubuntu:18.04"
	local shell="/bin/bash"

	if [ "$1" != "" ]; then
		image=$1
	fi

	# override shell for minimal images
	case "$image" in
		alpine*) shell=/bin/sh;;
	esac

	docker run -ti --rm --entrypoint=$shell -v $PWD:$PWD $image
}
