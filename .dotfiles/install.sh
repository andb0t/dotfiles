#!/bin/bash

./link.sh $1 || exit 1

if [ "$1" == "Android" ] || [ "$1" == "Centos" ]; then
    echo "Automatic installation not possible via apt on this platform. Use e.g. pkg or yum to install packages by hand!"
    exit
fi

echo "Now install software ..."
# Packages & package managers
sudo apt update
. "$DOTFILES_DIR/install/zsh.sh"
. "$DOTFILES_DIR/install/vim.sh"
. "$DOTFILES_DIR/install/tmux.sh"
. "$DOTFILES_DIR/install/rename.sh"
. "$DOTFILES_DIR/install/pass.sh"
. "$DOTFILES_DIR/install/tldr.sh"
. "$DOTFILES_DIR/install/jq.sh"
. "$DOTFILES_DIR/install/ranger.sh"
# . "$DOTFILES_DIR/install/direnv.sh"
# . "$DOTFILES_DIR/install/brew.sh"
# . "$DOTFILES_DIR/install/latex.sh"
# . "$DOTFILES_DIR/install/python.sh"
# . "$DOTFILES_DIR/install/misc.sh"
# . "$DOTFILES_DIR/install/java.sh"
# . "$DOTFILES_DIR/install/atom.sh"
# . "$DOTFILES_DIR/install/scala.sh"
# . "$DOTFILES_DIR/install/duply.sh"
