if "$VERBOSE"; then
  echo "Loading zsh/keybindings.zsh"
fi

typeset -g -A key
# test escape sequences with `sed -n l`

key[Escape]='^['
key[Return]='^M'
key[Up]='^[[A'
key[Down]='^[[B'
key[Right]='^[[C'
key[Left]='^[[D'
key[Home]='^[[H'
key[OtherHome]='^[[1~'
key[Insert]='^[[2~'
key[Delete]='^[[3~'
key[End]='^[[F'
key[OtherEnd]='^[[4~'
key[PgUp]='^[[5~'
key[PgDn]='^[[6~'

# Special sequences
key[C-Up]='^[[1;5A'
key[C-Down]='^[[1;5B'
key[C-Right]='^[[1;5C'
key[OtherC-Right]='^[OC'
key[C-Left]='^[[1;5D'
key[OtherC-Left]='^[OD'
key[C-k]='^K'
key[C-o]='^O'
key[C-r]='^R'
key[C-u]='^U'
key[Alt-Right]='^[[1;3C'
key[Alt-Left]='^[[1;3D'
key[Alt-k]='^[k'
key[C-Delete]='^[[3;5~'
key[C-Backspace]='^H'
key[S-Up]='^[[1;2A'
key[S-Down]='^[[1;2B'
key[S-Right]='^[[1;2C'
key[S-Left]='^[[1;2D'

# Still unfilled
[[ -n "${key[S-Up]}" ]]         && bindkey "${key[S-Up]}"      undefined-key
[[ -n "${key[S-Down]}" ]]       && bindkey "${key[S-Down]}"    undefined-key
[[ -n "${key[S-Right]}" ]]      && bindkey "${key[S-Right]}"   undefined-key
[[ -n "${key[S-Left]}" ]]       && bindkey "${key[S-Left]}"    undefined-key

# Sensible navigation
[[ -n "${key[Return]}" ]]       && bindkey "${key[Return]}"       accept-line-extended
[[ -n "${key[Home]}" ]]         && bindkey "${key[Home]}"         beginning-of-line
[[ -n "${key[OtherHome]}" ]]    && bindkey "${key[OtherHome]}"    beginning-of-line
[[ -n "${key[End]}" ]] 			&& bindkey "${key[End]}" 		  end-of-line
[[ -n "${key[OtherEnd]}" ]]		&& bindkey "${key[OtherEnd]}" 	  end-of-line
[[ -n "${key[Up]}" ]]           && bindkey "${key[Up]}"           history-beginning-search-backward
[[ -n "${key[Down]}" ]]         && bindkey "${key[Down]}"         history-beginning-search-forward
[[ -n "${key[Left]}" ]]         && bindkey "${key[Left]}"         backward-char
[[ -n "${key[Right]}" ]] 		&& bindkey "${key[Right]}" 		  forward-char
[[ -n "${key[C-Left]}" ]]  		&& bindkey "${key[C-Left]}"  	  backward-word
[[ -n "${key[OtherC-Left]}" ]] 	&& bindkey "${key[OtherC-Left]}"  backward-word
[[ -n "${key[C-Right]}" ]] 		&& bindkey "${key[C-Right]}" 	  forward-word
[[ -n "${key[OtherC-Right]}" ]]	&& bindkey "${key[OtherC-Right]}" forward-word
[[ -n "${key[Alt-Left]}" ]]     && bindkey "${key[Alt-Left]}"     widget-backward-word-end
[[ -n "${key[Alt-Right]}" ]] 	&& bindkey "${key[Alt-Right]}" 	  widget-forward-word-end
[[ -n "${key[C-r]}" ]] 		    && bindkey "${key[C-r]}" 		  history-incremental-search-backward
[[ -n "${key[PgUp]}" ]]         && bindkey "${key[PgUp]}"         widget-scroll-up
[[ -n "${key[PgDn]}" ]]         && bindkey "${key[PgDn]}"         widget-scroll-down

# Natural deletions
[[ -n "${key[Insert]}" ]]       && bindkey "${key[Insert]}"       overwrite-mode
[[ -n "${key[C-k]}" ]] 	    	&& bindkey "${key[C-k]}"		  kill-line
[[ -n "${key[C-u]}" ]] 	    	&& bindkey "${key[C-u]}"		  backward-kill-line
[[ -n "${key[Delete]}" ]] 		&& bindkey "${key[Delete]}"		  delete-char
[[ -n "${key[C-Delete]}" ]] 	&& bindkey "${key[C-Delete]}" 	  delete-word
[[ -n "${key[C-Backspace]}" ]]  && bindkey "${key[C-Backspace]}"  backward-delete-word

# -- Special keybindings ------------------------------------------------------

[[ -n "${key[Alt-k]}" ]] 		&& bindkey "${key[Alt-k]}" 		  widget-forget-history
[[ -n "${key[C-o]}" ]]          && bindkey -s "${key[C-o]}"       'ranger-cd\n'

# Always pad pipe with whitespace
bindkey '|' widget-self-insert-padded

