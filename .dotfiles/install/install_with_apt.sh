#!/bin/bash

echo "Install software with apt package manager ..."

sudo apt update -y && sudo apt upgrade -y

sudo apt install -y make
"$DOTFILES_DIR/install/apt/zsh.sh"
"$DOTFILES_DIR/install/apt/vim.sh"
"$DOTFILES_DIR/install/apt/tmux.sh"
"$DOTFILES_DIR/install/apt/rename.sh"
"$DOTFILES_DIR/install/apt/pass.sh"
"$DOTFILES_DIR/install/apt/tldr.sh"
"$DOTFILES_DIR/install/apt/jq.sh"
"$DOTFILES_DIR/install/apt/ranger.sh"
"$DOTFILES_DIR/install/apt/dos2unix.sh"
"$DOTFILES_DIR/install/apt/7zip.sh"
# "$DOTFILES_DIR/install/apt/direnv.sh"
# "$DOTFILES_DIR/install/apt/brew.sh"
# "$DOTFILES_DIR/install/apt/latex.sh"
"$DOTFILES_DIR/install/apt/pyenv.sh"
"$DOTFILES_DIR/install/apt/kubectl.sh"
# "$DOTFILES_DIR/install/apt/python.sh"
"$DOTFILES_DIR/install/apt/misc.sh"
# "$DOTFILES_DIR/install/apt/java.sh"
# "$DOTFILES_DIR/install/apt/atom.sh"
# "$DOTFILES_DIR/install/apt/scala.sh"
# "$DOTFILES_DIR/install/apt/duply.sh"
