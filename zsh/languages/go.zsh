if command_exists go; then
	export GOPATH=$HOME/go:$HOME/projects
	export PATH=$PATH:$HOME/go/bin:$HOME/projects/bin

	alias got="go test -v -cover -coverprofile=.gocover"
	alias goc="go tool cover -html=.gocover"
	alias gob="go test -v -bench . -benchmem"
	alias gobuild="go build -ldflags '-s -w' -gcflags='-trimpath=${HOME}' -asmflags='-trimpath=${HOME}'"
fi
