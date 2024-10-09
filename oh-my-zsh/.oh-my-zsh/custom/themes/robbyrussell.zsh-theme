export VIRTUAL_ENV_DISABLE_PROMPT=1

venv_info() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "%{$fg[cyan]%}($(basename $VIRTUAL_ENV))%{$reset_color%} "
  fi
}

PROMPT='
%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)
$(venv_info)%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} )'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
