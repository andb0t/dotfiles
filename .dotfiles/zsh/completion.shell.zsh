if "$VERBOSE"; then
    echo "Load $0"
fi

# Activate completion system - fix missing compdef function
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit

# Use same colors for autocompletion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Kubectl autocompletion
if [ -f /usr/bin/kubectl ]; then
    source <(kubectl completion zsh);
    # make autocompletion also work for alias
    complete -F __start_kubectl k
else
    message="Info: kubectl not installed. Skip autocompletion config."; echo -e "\e[01;33m$message\e[0m"
fi

# pyenv autocompletion
#if command -v pyenv root 1>/dev/null 2>&1; then

if command -v pyenv 1>/dev/null 2>&1; then
    . $(pyenv root)/completions/pyenv.zsh
else
    message="Info: pyenv not installed. Skip autocompletion config."; echo -e "\e[01;33m$message\e[0m"
fi
