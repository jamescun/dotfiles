# use human units for df/dh.
alias df="df -h"
alias du="du -h"

# always vim, alias :e and :q into shell.
alias vi="vim"
alias :e="vim"
alias :q="exit"

# nicer output from ls.
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	alias ls="ls -lh --color"
else
	alias ls="ls -Glh"
fi
