#!/bin/bash

./link.sh "$1" || exit 1

echo "Now install software ..."
if [ "$1" == "Android" ]; then
  "$DOTFILES_DIR/install/install_with_pkg.sh"
elif [ "$1" == "Centos" ]; then
  "$DOTFILES_DIR/install/install_with_yum.sh"
else
  "$DOTFILES_DIR/install/install_with_apt.sh"
fi
