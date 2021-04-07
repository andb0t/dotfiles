#!/bin/bash

echo "Install password-store ..."

pkg install -y pass
"$DOTFILES_DIR/pass/init.sh"

