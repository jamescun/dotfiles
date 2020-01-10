alias df="df -h"
alias du="du -h"

alias vi="vim"
alias :e="vim"
alias :q="exit"

# minimal output from LS on Linux and *BSD
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	alias ls="ls -lh --color"
else
	alias ls="ls -Glh"
fi

