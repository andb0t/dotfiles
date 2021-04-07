#!/bin/bash

echo "Initialize password-store ..."

mkdir -p "$HOME/.password-store"
pass git init
pass git remote add origin YOUR@EMAIL.COM:andb0t/password-store.git
# pass git remote add origin https://YOUR@EMAIL.COM/andb0t/password-store.git 
pass git fetch
pass git branch --set-upstream-to=origin/master master
pass git pull

