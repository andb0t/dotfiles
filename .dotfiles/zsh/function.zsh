if "$VERBOSE"; then
  echo "Loading zsh/function.zsh"
fi

# History management
function_histrl() {
  # Clear current history list
  fc -p $HISTFILE
  # Load $HISTFILE
  fc -R
}
function_histrm() {
  # Source: http://stackoverflow.com/a/29613573/1901977
  escaped=$(sed 's/[^^]/[&]/g; s/\^/\\^/g' <<< "$1")
  [[ "$OS" == "Darwin" ]] && macos="''"
  LC_ALL=C sed -i ${macos} "/;${escaped}$/d" $HISTFILE
  unset escaped
}

# Environment management
wintolin () {
    # convert an absolute windows path to an absolute linux path
    win_path=$1
    win_path=${win_path/C://c}
    win_path=${win_path//\\//}
    win_path="/mnt$win_path"
    echo "$win_path"
}

lintowin () {
    # convert a (possibly relative) linux path to an absolute windows path
    lin_path=$(readlink -f $1)
    lin_path=${lin_path//'\/mnt\/c'/'C:'}
    lin_path=${lin_path//'\/'/'\\'}
    echo "$lin_path"
}

paths () {
  ENV_VAR="PATH"
    result=$k1
  if [ -z $1 ]; then
    echo "Display PATH variable:"
  else
    ENV_VAR=$1
  fi
  ENV_VAR=${(P)ENV_VAR}
  echo -e ${ENV_VAR//:/\\n}
}
pathrm () {
  # Delete path of first occurance of key $1 from env variable $2
  KEY=$1
  ENV_VAR="PATH"
  if [ $2 ]; then
    ENV_VAR=$2
  fi
  ENV_VAR_CONT=${(P)ENV_VAR}
  # echo "Removing path of first occurance of $KEY from $ENV_VAR !"
  NEW_ENV=$(echo $ENV_VAR_CONT | sed 's#:[^:]*'"$KEY"'[^:]*##')
  export $ENV_VAR=$NEW_ENV
}
pathrmall () {
    # Like pathrm but delete all occurances
    KEY=$1
    ENV_VAR="PATH"
    if [ $2 ]; then
        ENV_VAR=$2
    fi
    ENV_VAR_CONT=${(P)ENV_VAR}
    if [[ $ENV_VAR_CONT == *$KEY* ]]; then
          pathrm $1 $2
          pathrmall $1 $2
    fi
}
function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}
