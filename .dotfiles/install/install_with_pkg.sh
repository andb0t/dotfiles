#!/bin/bash

echo "Install software with pkg package manager..."

pkg update && pkg upgrade

pkg install -y termux-api
pkg install -y man
pkg install -y dnsutils  # dig
pkg install -y vim
pkg install -y rename
pkg install -y jq
pkg install -y tmux
pkg install -y wget
pkg install -y ranger
# pkg install kubectl
pkg install -y nmap
pkg install -y imagemagick  # convert

"$DOTFILES_DIR"/install/pkg/pass.sh
"$DOTFILES_DIR"/install/pkg/python.sh

