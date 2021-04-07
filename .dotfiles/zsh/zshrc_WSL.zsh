if "$VERBOSE"; then
    echo "Load $0 -> $(readlink -f $0)"
fi

export WIN_USER="$(echo $PATH | sed "s#.*/mnt/c/Users/\([a-zA-Z0-9]*\).*#\1#")"
export TRASH=~/trash
export WIN_HOME=/mnt/c/Users/"$WIN_USER"
export DROPBOX="$WIN_HOME"/Dropbox
export DESKTOP="$WIN_HOME"/Desktop
export DOWNLOADS="$WIN_HOME"/Downloads
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export THUNDERBIRD_DIR="$WIN_HOME"/AppData/Roaming/Thunderbird/Profiles/6xpjexvo.default

alias    cdw="cd \"$WIN_HOME\""
alias    cdp="cd \"$WIN_HOME\"/Projects"
alias docker="docker.exe"

x() {
  # open explorer window at path if given otherwise at pwd
  if [[ -n $1 ]]; then
    WINDOWS_PATH=$(lintowin $1)
  else
    WINDOWS_PATH=$(lintowin .)
  fi
  explorer.exe $WINDOWS_PATH
  return 0
}

mount_drive() {
  if [ -z "$1" ]; then
    echo "No drive specified. Abort!"
    return
  fi
  sudo mkdir -p /mnt/$1
  sudo mount -t drvfs $1: /mnt/$1
  echo "Drive $1 is now mounted at /mnt/$1"
}

atom () {
    # start atom in the right directory
    filepath=$(lintowin $1)
    "$WIN_HOME/AppData/Local/atom/atom.exe" "$filepath"
}

# Setting for XServer windows
export DISPLAY=:0

# Configure go
prepend_path "/usr/local/go/bin"
export GOPATH="$WIN_HOME/Projects/go"
prepend_path "$GOPATH/bin"

# remove windows python paths to not disturb pipenv
pathrmall /mnt/c/Users/"$WIN_USER"/AppData/Local/Programs/Python
pathrmall /mnt/c/Users/"$WIN_USER"/AppData/Local/Programs/Python
pathrmall /mnt/c/Users/"$WIN_USER"/.pyenv/pyenv-win

# Alert command
alias alert='TMP_STATUS=$?; powershell.exe -command New-BurntToastNotification -AppLogo \"C:\\Users\\$WIN_USER\\Pictures\\$([ "$TMP_STATUS" = "0" ] && echo ok || echo error).jpg\" -Text \"$([ "$TMP_STATUS" = "0" ] && echo Finished successfully! || echo Failed!)\",\"$(tail -n1 $HISTFILE | sed "s/[: 0-9]*;//" | sed "s/[|&;]* *alert//")\"'

# configure pass to use windows clipboard
passc () {
    pass "$1" | head -1 | clip.exe
}
