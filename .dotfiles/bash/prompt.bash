if "$VERBOSE"; then
  echo "Loading prompt.bash"
fi

# customize command line prompt
export PS1='\[\u@\h: \e[0;33m\]\w\[\e[0;32m\]$(__git_ps1)\[\e[m\]\n\$ '

# customize window title
PROMPT_COMMAND='echo -ne "\033]0; ${USER}@${HOSTNAME}: ${PWD} \007"'
