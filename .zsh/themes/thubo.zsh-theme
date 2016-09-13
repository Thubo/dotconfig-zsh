function git_prompt() {
 if [[ ! $(git_prompt_info) == "" ]]; then
   echo $(git_prompt_info)/ $(git_current_user_email)
 fi
}

function toggle_prompt(){
  if [[ $SHORT_PROMPT -eq "0" ]]; then
    SHORT_PROMPT="1"
    set_prompt
  else
    SHORT_PROMPT="0"
    set_prompt
  fi
}

function set_prompt(){
  if [[ $SHORT_PROMPT -eq "1" ]]; then
    PROMPT='%{${fg_bold[green]}%}%n@%m %{${fg_bold[white]}%}%1~ %{${fg[green]}%}%(!.#.>)%{$reset_color%} '
    RPROMPT=''
  else
    PROMPT='%{${fg_bold[green]}%}%n@%m %{${fg_bold[white]}%}%~ %{${fg[green]}%}%(!.#.>)%{$reset_color%} '
    RPROMPT='%{$fg[green]%}$(git_prompt)%{$reset_color%}'
  fi
}

SHORT_PROMPT="0"
set_prompt

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[red]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
