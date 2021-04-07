#!/usr/bin/env bash

echo "Installing brew ..."

if hash brew 2>/dev/null; then
  echo "brew is already installed. Skip!"
  return
fi

# get brew

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# add to path for this session

test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"

# Install packages

#apps=(foo bar)

#brew install "${apps[@]}"
