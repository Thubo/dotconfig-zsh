# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="thubo"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump docker docker-compose git web-search vagrant)

# User configuration

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/lib/zstyle.zsh

# Further config
unsetopt share_history

# Default editor
export EDITOR=vim

# ...using CTRL+P/N
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# Make <Enter> work in tab completion on the first try
# See also http://www.zsh.org/mla/users/2009/msg01018.html
# bindkey -M menuselect '^M' .accept-line

# Dircolors
if type dircolors > /dev/null; then
  eval "`dircolors`"
fi

# if [[ $(uname) -eq "Darwin" ]]; then
#   if [ -f $(brew --prefix)/etc/bash_completion ]; then
#     . $(brew --prefix)/etc/bash_completion
#   fi
# fi

# Source iterm integration
if [ -f $HOME/.zsh/zsh_startup.iterm ]; then
   source $HOME/.zsh/zsh_startup.iterm
fi

# Source aliases
if [ -d $HOME/.helper/aliases ]; then
  for file in $HOME/.helper/aliases/*.alias; do . $file; done
fi

# Source functions
if [ -d $HOME/.helper/functions ]; then
  for file in $HOME/.helper/functions/*.function; do . $file; done
fi

# Autojump
# [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
# if [[ -f /opt/autojump/bin/autojump.bash ]]; then
#   source "/opt/autojump/bin/autojump.bash"
# fi

#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
# Dynamic 'motd' - not realy a motd, but similar function
if type dynmotd > /dev/null 2>&1 ; then
  dynmotd
fi
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
