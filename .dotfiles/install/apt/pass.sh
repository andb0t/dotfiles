#!/bin/bash

echo "Install password-store ..."

sudo apt install -y pass
"$DOTFILES_DIR/pass/init.sh"

