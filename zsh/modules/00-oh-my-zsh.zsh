# set the source for oh-my-zsh to vendored repository.
export ZSH=$DOTFILES/zsh/vendor/ohmyzsh

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh
