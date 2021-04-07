# My dotfiles

## Initial setup
Clone repo to `.dotfiles`
```shell
git clone --recursive YOUR@EMAIL.COM:andb0t/dotfiles.git ~/.dotfiles
# git clone --recursive https://YOUR@EMAIL.COM/andb0t/dotfiles.git ~/.dotfiles  # alternative via HTTPS
cd ~/.dotfiles
# install AND create symlinks
./install.sh [SETUP]  # execute without to see options
# ONLY create symlinks
./link.sh [SETUP]
```

## Todo
* customize ipython in ~/.ipython
* customize matplotlib in ~/.config/matplotlib


## Manual operations
* install atom package package-sync and sync, execute to update
* port gpg keys to new PC
  ```
  # on old PC
  gpg --list-keys  # read ID of gpg key
  # export ID=THE_ID
  gpg --export $ID > public.key
  gpg --export-secret-key $ID > private.key
  # on new PC
  gpg --import public.key
  gpg --import private.key
  gpg --edit-key [KEYNUMBER]
  # trust
  # 5
  ```
* swap Esc and Caps Lock:
    * SLC6: system preferences >> keyboard ...
    * Ubuntu: `dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"` (`swapescape` to swap)
* WSL:
    * install Xming and run it to emulate a dummy Xserver in WSL
    * if necessary: swap menu key (right-click key) with right ctrl
    * add $USER/powershell to path
    * copy relevant scripts to $WIN_HOME: `$DOTFILES_DIR/bin/WSL_push_win_changes`
* connect thunderbird with backupped profile
* Virtualbox:
    * copy&paste:
        * install linux-headers-[machine] from within VM
        * mount guest editions CD in VM from Vbox menu, run it
        * enable bidirectional copy & paste
* Windows:
    * follow instructions in this [README](windows/README.md)
* Android:
    * install `termux-api` app from app store, in addition to the installation in termux


## General information
Special file extensions:
* `.shell`: sourced for any shell
* `.zsh`: sourced if shell == zshell
* `.bash`: sourced if shell == bash

## Incomplete list of essential commands

### VIM
* \v[REGEX]  # make regex matching very magic ((), {}, <>, ?, +)
* :tabe [FILE]  # add tab
* :[tabn, tabp]  # switch tab
* .  # apply same action again
* u  # undo
* CTRL-r  # redo
* :sp [FILE]  # split window
* CTRL-w + arrowkey  # switch between split windows
* :qa close all tabs
* vim -o [FILES]  # open files in split mode
* v + <movement> + y  # mark text and copy
* d + $  # delete from cursor position until EOL
* CTRL + [d,u,e,y]  # scroll down (up) half a screen (a line)
* CTRL + [o,i]  # jump back (forward) to last cursor position
* :set [wrap, nowrap]  # en/disable line wrap
* :set nonu  # disable line numbers (`:set nu` to switch on)
* g (G)  # jump to beginning (end) of file

### Zshell
* Navigation
    * dirs  # list directory history
    * cd [[+,-]Number]  # change to directory
    * ls 2/*  # example for expansion of dir number
* Jobs
    * `setopt NO_HUP`  # run command ignoring hangup signals
* Bash
    * `bash -c "COMMAND"`  # execute commands with bash

### tmux
* tmux ls  # see all processes
* tmux a [-t [NUMBER]]  # reattach process [with number NUMBER]
Prefix Ctrl-q:
* PREF + z  # make pane go full screen and back
* PREF + [np]  # switch to previous (next) window
* PREF + d  # detach process to run in bkg
* PREF + \[  # enter vi mode to scroll, search etc (q to leave vi mode)
* PREF + x  # kill current pane
* PREF + c  # create new window
* PREF + space  # cycle through aspect layout
* PREF + Ctrl-s # save current session
* PREF + Ctrl-r # reload saved session


### pass, duply, gpg, rsync
* `pass  # list saved items`
* `duply [BACKUP_NAME] status  # check backup status`
* `duply [BACKUP_NAME] backup  # create backup`
* `gpg --list-keys`
* `gpg --list-private-keys`
* `gpg --decrypt [FILE.gpg]`
* `gpg --encrypt [FILE]`

* unencrypted backup via rsync, e.g.
  `rsync -aPv --exclude-from=$DOTFILES_DIR/rsync/exclude_ExternalDrive_Lenovo.txt /media/MYUSER/ExternalDrive_Lenovo ~/Backups`

### Resources
* [awk](http://www.grymoire.com/Unix/awk.html): `ls -l | awk '/em/{print $9 " was last modified at " $8}'`
* [grep (g/regular expression/p)](http://www.grymoire.com/Unix/grep.html): `grep 'www\..*\.html' *`
* [sed (Stream EDitor)](http://www.grymoire.com/Unix/sed.html) `env | sed -r 's/^([^=]*)=.*/\1/'`
* [find](http://www.grymoire.com/Unix/Find.html): `find . -name "*.zsh" -print |  grep -v zsh/zsh-`
* [Regex101](https://regex101.com/)


## Misc

### WSL:  connect WSL to xfce4 X server
* start Xlaunch, using settings in xming/config.xlaunch
* execute `xfce4-session` in shell
