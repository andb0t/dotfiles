if "$VERBOSE"; then
  echo "Loading config.zsh"
fi

# -- Changing directories -----------------------------------------------------

DIRSTACKSIZE=8

setopt   AUTO_PUSHD         # Track history of directories for navigation
setopt   PUSHD_IGNORE_DUPS  # Keep dir stack clean of dupes
setopt   PUSHD_SILENT       # Otherwise popd prints the cd'd directory
unsetopt PUSHD_TO_HOME      # Ensure pushd swaps to most current dir and not $HOME


# -- Completion ---------------------------------------------------------------

# Completion behavior I like
setopt   AUTO_LIST
setopt   AUTO_MENU

unsetopt AUTO_NAME_DIRS    # Disable named dirs (ASDF=`pwd` would show ~ASDF in prompt)
setopt   COMPLETE_ALIASES  # Don't expand aliases _before_ completion has finished (like: git comm-<TAB>)
setopt   GLOB_COMPLETE     # Show menu with options matching pattern (like: cd D*s<TAB>)
unsetopt LIST_BEEP         # Shhh


# -- Globbing ---------------------------------------------------

setopt   MARK_DIRS          # Append a trailing '/' to all directory names resulting from globbing
setopt   GLOBDOTS           # Match also file names starting with dot
setopt   EXTENDED_GLOB      # Allow extended globbing, such as `ls (^.git/)#` to glob all files not in `.git`


# -- History ------------------------------------------------------------------

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=$HISTSIZE

setopt   EXTENDED_HISTORY      # Add command line timestamps to history
unsetopt HIST_BEEP             # Shhh
setopt   HIST_FCNTL_LOCK       # Prevent history corruption
setopt   HIST_IGNORE_ALL_DUPS  # Keep history clean from dupes
setopt   HIST_IGNORE_SPACE     # Do not record command lines starting with space
setopt   HIST_NO_FUNCTIONS     # Do not record function definitions
setopt   HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line
setopt   HIST_SAVE_NO_DUPS     # Ensure no dupes when writing out to history file
setopt   HIST_VERIFY           # Do not execute lines directly on history expansion
setopt   INC_APPEND_HISTORY    # Write to $HISTFILE immediately
setopt   SHAREHISTORY          # Share history across terminals 


# -- I/O ----------------------------------------------------------------------

setopt   CORRECT               # Try to correct spelling of commands
#setopt   IGNORE_EOF            # Do not exit shell on <C-D>
setopt   INTERACTIVE_COMMENTS  # Allow comments in interactive shell


# -- Prompt -------------------------------------------------------------------

setopt   PROMPT_SUBST   # Enable command substitution in the prompt


# -- Misc ---------------------------------------------------------------------

setopt NO_BEEP


# -- Package configuration-----------------------------------------------------

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan,bold'

ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(accept-line-extended)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bold'  # default fg=8 does not work on some terminals

