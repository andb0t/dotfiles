if "$VERBOSE"; then
  echo "Loading zsh/prompt.zsh"
fi

# Deﬁne associative array parameters $fg and $bg
autoload colors && colors

if (( $+commands[git] ))
then
    git="$commands[git]"
else ""
	git="/usr/bin/git"
fi

check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=' '
    EXIT_CODE_PROMPT+="%{$bg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%}"
  fi
  echo "$EXIT_CODE_PROMPT"
}

prompt_git_prompt_info () {
  ref=$(git symbolic-ref HEAD 2>/dev/null)
  if [[ $ref == "" ]]; then
    echo $(git rev-parse --short HEAD)
  else
    echo ${ref#refs/heads/}
  fi
}

prompt_venv_prompt_info () {
  if [[ "$VIRTUAL_ENV" == "" ]]; then
    echo ""
  else
    venv_name=$(basename $VIRTUAL_ENV | sed "s/-[^-]*$//")
    echo "%{$fg_bold[magenta]%}[$venv_name]%{$reset_color%} "
  fi
}

prompt_unpushed () {
  local revision
  revision="$(git rev-parse --symbolic-full-name @{push} 2> /dev/null)"
  [[ $? != 0 ]] && revision="$(git rev-parse --symbolic-full-name @{upstream} 2> /dev/null)"
  git cherry -v ${revision} 2> /dev/null
}

prompt_need_push () {
  if [[ $(prompt_unpushed) == "" ]]
  then
    echo ""
  else
    N_PUSHES="`git log @{u}..HEAD --oneline | wc -l`"
    PUSH_ELEMENT="↑"
    PUSH_STRING=""
    if [[ $N_PUSHES -lt 5 ]]; then
      for i in $(seq $N_PUSHES); do PUSH_STRING+=$PUSH_ELEMENT; done
    else
      PUSH_STRING=" $N_PUSHES×$PUSH_ELEMENT"
    fi
    echo "%{$fg_bold[magenta]%}$PUSH_STRING%{$reset_color%}"
  fi
}

prompt_git_dirty() {
  if ! $(git rev-parse 2>/dev/null);
  then
    echo ""
  else
    BRANCH_NAME=$(prompt_git_prompt_info)
    if [[ ${#BRANCH_NAME} -gt 20 ]]
    then
        BRANCH_NAME=${BRANCH_NAME:0:17}"..."
    fi
    if ! git diff --exit-code --quiet --cached;
    then
      GIT_CACHED="`git diff --cached --shortstat`"
      N_CACHED="`echo $GIT_CACHED | sed -r 's/ *([0-9]+).*/\1/'`"
      CACHED_ELEMENT="●"
      CACHED_STRING=""
      if [[ $N_CACHED -lt 5 ]]; then
        for i in $(seq $N_CACHED); do CACHED_STRING+=$CACHED_ELEMENT; done
      else
        CACHED_STRING=" $N_CACHED×$CACHED_ELEMENT"
      fi
      echo "(%{$fg_bold[yellow]%}$BRANCH_NAME$CACHED_STRING%{$reset_color%}$(prompt_need_push)) "
    else
      if ! git diff --exit-code --quiet; 
      then
        echo "(%{$fg_bold[red]%}$BRANCH_NAME%{$reset_color%}$(prompt_need_push)) "
      else
        echo "(%{$fg_bold[green]%}$BRANCH_NAME%{$reset_color%}$(prompt_need_push)) "
     fi
    fi
  fi
}

prompt_user_name() {
  echo "%{$fg_bold[white]%}$(whoami)%{$reset_color%}"
}

prompt_host_name() {
  echo "%{$fg_bold[white]%}@%m%{$reset_color%}"
}

prompt_directory_name(){
  DIRECTORY_NAME="%2~%"
  echo "%{$fg_bold[cyan]%}$DIRECTORY_NAME\%{$reset_color%}"
}

prompt_top_right_prompt () {
  local zero='%([BSUbfksu]|([FK]|){*})'
  local left_length=${#${(S%%)${1}//$~zero/}}
  #local right_prompt=' [%*]'  # updates itself at reset-prompt
  local right_prompt="$last_exit_code ■ [`date +%H:%M:%S`]"
  right_length=${#${(S%%)${right_prompt}//$~zero/}}
  local fill_length=$(($COLUMNS-$left_length-$right_length-1))
  if [[ $fill_length -gt 50 ]]; then
    right_prompt=${(r:$fill_length::─:)}$right_prompt
  elif [[ $fill_length -gt 0 ]]; then
    right_prompt=${(r:$fill_length:: :)}$right_prompt
  fi
  echo "$right_prompt"
}

prompt_lower_prompt () {
  if [[ $EUID -eq 0 ]]; then
    prompt="%{$fg_bold[red]%}"'\n> '"%{$reset_color%}"
  else
    prompt=$'\n› '
  fi
  echo $prompt
}

prompt_wtitle() {
  case $TERM in
  xterm*|rxvt)
    print -Pn "\e]2;$1\a"
    ;;
  esac
}

prompt_set_prompt() {
  local left_prompt="$(prompt_user_name)$(prompt_host_name): $(prompt_directory_name) $(prompt_git_dirty)$(prompt_venv_prompt_info)"
  PROMPT="$left_prompt$(prompt_top_right_prompt $left_prompt)"
  PROMPT+="$(prompt_lower_prompt)"
  RPROMPT=''
}

precmd() {
  local last_exit_code=$(check_last_exit_code)
  prompt_wtitle "%m: %55<...<%~"
  prompt_set_prompt
}

