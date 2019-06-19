if "$VERBOSE"; then
  echo "Loading function.bash"
fi

# Switch long/short prompt

ps0() {
  unset PROMPT_COMMAND
  PS1='$ '
}

ps1() {
  source "$DOTFILES_DIR"/system/prompt
}

# Environment management
paths () {
  TEST="PATH"
  if [ -z $1 ]; then
    echo "Display PATH variable:"
  else
    TEST=$1
  fi
  TEST=${!TEST}
  echo -e ${TEST//:/\\n}
}
