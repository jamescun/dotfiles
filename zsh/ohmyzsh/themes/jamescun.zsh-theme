# =========================================================================== #
# ZSH Theme by jamescun
#
# Source: https://github.com/jamescun/dotfiles
# =========================================================================== #
# Environment Variables:
#  $ENV: adds the environment name to first prompt line (default `local`).
# =========================================================================== #

# --------------------------------------------------------------------------- #
# Configuration
# --------------------------------------------------------------------------- #

# configure the color of local, non-prod and prod environments.
ZSH_THEME_JAMESCUN_ENV_LOCAL_COLOR='%{$FX[dim]%}'
ZSH_THEME_JAMESCUN_ENV_OTHER_COLOR='%{$fg[yellow]%}'
ZSH_THEME_JAMESCUN_ENV_PROD_COLOR='%{$fg_bold[red]%}'

# configure the regular expression to match local and prod environments.
ZSH_THEME_JAMESCUN_ENV_LOCAL_MATCH="local"
ZSH_THEME_JAMESCUN_ENV_PROD_MATCH="prod"

# configure the color of the username and hostname.
ZSH_THEME_JAMESCUN_HOST_COLOR='%{$FX[dim]%}'

# configure the color of the working directory name.
ZSH_THEME_JAMESCUN_PWD_COLOR='%{$fg[cyan]%}'

# configure the color of the prompt line after a command exits zero.
ZSH_THEME_JAMESCUN_OK_COLOR='%{$fg[green]%}'
ZSH_THEME_JAMESCUN_ERROR_COLOR='%{$fg[red]%}'

# configure the color of the time following the prompt.
ZSH_THEME_JAMESCUN_TIME_COLOR='%{$FX[dim]%}'


# --------------------------------------------------------------------------- #
# Apply Theme
# --------------------------------------------------------------------------- #

# --- left prompt --- #

# ensure an empty line after the previous prompt.
PROMPT="
"

# set $ENV to `local` if none configured.
ENV="${ENV:-local}"

# highlight environment name when in production environment.
if [[ $ENV =~ $ZSH_THEME_JAMESCUN_ENV_PROD_MATCH ]]; then
	PROMPT+="%{$ZSH_THEME_JAMESCUN_ENV_PROD_COLOR%}%{$ENV%}"
elif [[ $ENV =~ $ZSH_THEME_JAMESCUN_ENV_LOCAL_MATCH ]]; then
	PROMPT+="%{$ZSH_THEME_JAMESCUN_ENV_LOCAL_COLOR%}%{$ENV%}"
else
	PROMPT+="%{$ZSH_THEME_JAMESCUN_ENV_OTHER_COLOR%}%{$ENV%}"
fi

# prefix first line with environment name, username, host.
PROMPT+="%{$reset_color%}%{$ZSH_THEME_JAMESCUN_HOST_COLOR%} %n@%m%{$reset_color%}"

# append current path relative to $HOME.
PROMPT+="%{$ZSH_THEME_JAMESCUN_PWD_COLOR%} %~%{$reset_color%}
"

# begin prompt with `[` themed by exit status.
PROMPT+="%(?:%{$ZSH_THEME_JAMESCUN_OK_COLOR%}[ :%{$ZSH_THEME_JAMESCUN_ERROR_COLOR%}[ )"

# reset color.
PROMPT+="%{$reset_color%}"


# --- right prompt --- #

# include git branch and clean/dirty before enc of prompt.
RPROMPT='$(git_prompt_info) '

# end prompt with `]` themed by exit status.
RPROMPT+="%(?:%{$ZSH_THEME_JAMESCUN_OK_COLOR%}] :%{$ZSH_THEME_JAMESCUN_ERROR_COLOR%}] )"

# add HH:MM:SS after prompt themed by exit status.
RPROMPT+="%{$ZSH_THEME_JAMESCUN_TIME_COLOR%}%D{%T}"

# reset color.
RPROMPT+="%{$reset_color%}"


# --- git prompt theme --- #

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FX[dim]%}git:%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"


# --------------------------------------------------------------------------- #
# Functions
# --------------------------------------------------------------------------- #

# override the standard git-prompt call to place the git coloring at the start
# based on the HEAD being dirty/clean.
function git_prompt_info() {
	# Get either:
	# - the current branch name
	# - the tag name if we are on a tag
	# - the short SHA of the current commit
	local ref
	ref=$(__git_prompt_git symbolic-ref --short HEAD 2> /dev/null) \
	|| ref=$(__git_prompt_git describe --tags --exact-match HEAD 2> /dev/null) \
	|| ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) \
	|| return 0

	echo "${ZSH_THEME_GIT_PROMPT_PREFIX}$(parse_git_dirty)${ref//\%/%%}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}
