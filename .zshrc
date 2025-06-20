# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.bin:$PATH
export PATH=/usr/local/bin:$PATH

# LC Stuff
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 6

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="candy"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

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
plugins=(
  1password
  alias-finder
  asdf
  brew
  colorize
  docker
  docker-compose
  extract
  gcloud
  git
  helm
  iterm2
  kubectl
  rsync
  ssh-agent

  fzf-tab
  # zsh-vi-mode
  zsh-fzf-history-search
  # fzf-zsh-plugin
  zsh-z
)

source $ZSH/oh-my-zsh.sh

#
# User configuration
#

# Default editor
export EDITOR=vim

# FZF Plugin
export FZF_CTRL_T_COMMAND='rg --files --no-ignore --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" 2> /dev/null'

# ...using CTRL+P/N
# bindkey "^P" up-line-or-beginning-search
bindkey "^P" up-line-or-search
# bindkey "^N" down-line-or-beginning-search
bindkey "^N" down-line-or-search

# Edit Command Line Input
bindkey '^x^e' edit-command-line

# Search
# bindkey '^R' history-incremental-search-backward

# Make <Enter> work in tab completion on the first try
# See also http://www.zsh.org/mla/users/2009/msg01018.html
# bindkey -M menuselect '^M' .accept-line

# make zsh-vi-mode compatible with fzf plugins
function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

# zoxide
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi

# Source aliases
# if [ -d $HOME/.helper/aliases ]; then
  # for file in $HOME/.helper/aliases/*.alias; do . $file; done
# fi

# Source functions
# if [ -d $HOME/.helper/functions ]; then
  # for file in $HOME/.helper/functions/*.function; do . $file; done
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
