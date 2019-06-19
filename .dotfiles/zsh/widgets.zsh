if "$VERBOSE"; then
  echo "Loading widgets.zsh"
fi

# -- Movement -----------------------------------------------------------------

function widget-backward-word-end () {
  [[ $RBUFFER[1] == ' ' ]] && zle backward-char
  zle vi-backward-blank-word-end
  [[ $#LBUFFER != 0 ]] && zle forward-char
}
zle -N backward-word-end

function widget-forward-word-end () {
  zle vi-forward-blank-word-end
  zle forward-char
}
zle -N widget-forward-word-end

function widget-scroll-up () {
  if [ ! -z $TMUX ]; then
    tmux copy-mode -u
  fi
}
zle -N widget-scroll-up

function widget-scroll-down () {
  if [ ! -z $TMUX ]; then
    tmux copy-mode
  fi
}
zle -N widget-scroll-down

# -- History control ----------------------------------------------------------

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search

# Remove input/suggestion from history
function widget-forget-history () {
  local cmd=$BUFFER$POSTDISPLAY
  # Trim trailing whitespace
  cmd=${cmd//[[:space:]]%/}
  # Forget history
  function_histrm "${cmd}"
  function_histrl
  # Clean buffer
  region_highlight=("0 ${#cmd} bold,standout")
  BUFFER=${cmd}
  zle send-break
}
zle -N widget-forget-history


# -- Misc ---------------------------------------------------------------------

# Enter white spaces around the inserted key
# Based on: http://www.zsh.org/mla/users/2006/msg00690.html
function widget-self-insert-padded () {
  setopt localoptions noksharrays
  zle self-insert
  [[ $LBUFFER[-2] != " " ]] && LBUFFER[-1]=" $LBUFFER[-1]"
  LBUFFER[-1]="$LBUFFER[-1] "
}
zle -N widget-self-insert-padded


# -- zle mode -----------------------------------------------------------------

# indicate zle mode
function zle-keymap-select {
    ZLE_STRING="(%{$fg_bold[red]%}zle mode - leave with 'i'%{$reset_color%})"
    if [[ ${RPROMPT/$ZLE_STRING} == $RPROMPT ]]; then
        RPROMPT="$ZLE_STRING $RPROMPT" # eats first line if no trailing space
    else
        RPROMPT=${RPROMPT#$ZLE_STRING}
    fi
    RPROMPT="`echo $RPROMPT | sed 's/ *$//'`"
    zle reset-prompt
}
zle -N zle-keymap-select


# -- accept line --------------------------------------------------------------

function accept-line-extended () {
    TIME_STAMP="%{$fg_bold[green]%}↓%{$reset_color%} %{$fg[green]%}[`date +%H:%M:%S`]%{$reset_color%}"
	RPROMPT="$RPROMPT $TIME_STAMP"
	zle reset-prompt
    zle accept-line
}
zle -N accept-line-extended
