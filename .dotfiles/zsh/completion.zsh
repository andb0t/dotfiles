if "$VERBOSE"; then
  echo "Loading completion.zsh"
fi

# Activate completion system - fix missing compdef function
autoload -Uz compinit
compinit

# Use same colors for autocompletion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Kubectl autocompletion
if [ -f /usr/bin/kubectl ]; then 
    source <(kubectl completion zsh); 
    # make autocompletion also work for alias
    complete -F __start_kubectl k
else
    echo "Info: no kubectl installed. Skip autocomplete."
fi

