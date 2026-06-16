# set the path to the vendored oh-my-zsh repository.
export ZSH=$DOTFILES/zsh/vendor/ohmyzsh

# set the path to the oh-my-zsh plugins.
export ZSH_CUSTOM=$DOTFILES/zsh/ohmyzsh

ZSH_THEME="jamescun"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
plugins=(git macos nats task)

source $ZSH/oh-my-zsh.sh
