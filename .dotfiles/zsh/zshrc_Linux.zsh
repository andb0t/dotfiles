if "$VERBOSE"; then
    echo "Load $0 -> $(readlink -f $0)"
fi

export TEXINPUTS=.:$HOME/tex/TeXInputs//:$TEX//:

prepend_path "."
prepend_path "$HOME/bin"
prepend_path "$TEXPATH"
append_path "/usr/local/X11R6/bin"

export DROPBOX="$HOME/Dropbox"
export TRASH="$HOME/trash"
export THUNDERBIRD_DIR=~/.thunderbird/xhg592sb.default

alias cdp="cd \"$HOME\"/Projects"

# loading NVM
export NVM_DIR="/home/$USER/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Configure go
export GOPATH="$HOME/go"
append_path "$GOPATH/bin"

# Alert command
alias alert='TMP_STATUS=$?; notify-send --urgency=low -i "$([ "$TMP_STATUS" = "0" ] && echo terminal || echo error)" "$(tail -n1 $HISTFILE | sed "s/[: 0-9]*;//" | sed "s/[|&;]* *alert//")"'
