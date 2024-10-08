ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

set-long-prompt() { PROMPT='
%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)
%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} )' }
precmd_functions=(set-long-prompt)

set-short-prompt() {
  if [[ $PROMPT != '%# ' ]]; then
    PROMPT='%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} )'
    zle .reset-prompt
  fi
}

zle-line-finish() { set-short-prompt }
zle -N zle-line-finish

trap 'set-short-prompt; return 130' INT
