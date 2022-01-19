if ! hg prompt 2>/dev/null; then
  function hg_prompt_info {; }
else
  function hg_prompt_info {
    hg prompt --angle-brackets "\
< on %{$fg[magenta]%}<branch>%{$reset_color%}>\
< at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
  }
fi

function box_name {
  [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

# Virtualenv: current working virtualenv
function prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $PYENV_VIRTUALENV_DISABLE_PROMPT ]]; then
    echo -n "(%{$fg[blue]%}$(basename $virtualenv_path)%{$reset_color%}) "
  fi
}

# Git repo status
function prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $PYENV_VIRTUALENV_DISABLE_PROMPT ]]; then
    echo -n "(%{$fg[blue]%}$(basename $virtualenv_path)%{$reset_color%}) "
  fi
}

PROMPT='
$(prompt_virtualenv)%{$fg_bold[green]%}%~%{$reset_color%}$(hg_prompt_info)$(git_prompt_info)
%(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" (%{$fg[yellow]%}branch: "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}?"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[orange]%}!"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"

RPROMPT='%{$fg[red]%}%(?..✘)%{$reset_color%}'


# %{$fg[blue]%}%n%{$reset_color%}@%{$fg[yellow]%}$(box_name)%{$reset_color%}:
