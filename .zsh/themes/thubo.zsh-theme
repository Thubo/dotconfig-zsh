function git_prompt() {
 if [[ ! $(git_prompt_info) == "" ]]; then
   echo $(git_prompt_info)/ $(git_current_user_email)
 fi
}

PROMPT='%{${fg_bold[green]}%}%n@%m %{${fg_bold[white]}%}%~ %{${fg[green]}%}%(!.#.>)%{$reset_color%} '
RPROMPT='%{$fg[green]%}$(git_prompt)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[red]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
