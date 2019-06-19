#!/usr/bin/env bash

echo "Installing atom ..."

if hash atom 2>/dev/null; then
  echo "atom is already installed. Skip!"
  return
fi

sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt install atom
