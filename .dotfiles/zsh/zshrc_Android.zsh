#!/bin/bash

if "$VERBOSE"; then
    echo "Load $0 -> $(readlink -f $0)"
fi

echo "Configure termux environment"

# Protect from accidental apt usage
alias apt="echo Warning! Using apt as root will screw up permissions! Aliased to pkg.; pkg"

# System exports
export DROPBOX="$HOME/storage/shared/Android/data/com.dropbox.android/files/u91286424/scratch/"
export DOWNLOADS="$HOME/storage/downloads"
export TRASH="$HOME/trash"

# Alert command (bugs: led light always red)
alias alert='TMP_STATUS=$?; termux-notification --led-color "$([ "$TMP_STATUS" = "0" ] && echo 009900 || echo 990000)" --title "$([ "$TMP_STATUS" = "0" ] && echo Finished successfully! || echo Failed!)" --content "$(tail -n1 $HISTFILE | sed "s/[: 0-9]*;//" | sed "s/[|&;]* *alert//")"'
