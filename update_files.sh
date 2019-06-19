#!/bin/bash

echo "Sync files ..."
rsync -rE --exclude-from=rsync_exclude.txt --delete-excluded "$DOTFILES_DIR" .

echo "Remove email addresses ..."
find .dotfiles/ -type f -exec sed -i 's/\w*@\w*\.\w*/YOUR@EMAIL\.COM/g' {} \;

echo "Remove my name ..."
NAMES=$(grep name ~/.gitconfig | sed 's/name = \(.*\)/\1/g')
IFS=' ' read -r -a array <<< "$NAMES"
for element in "${array[@]}"
do
    sed -i "s/$element/NAME/g" .dotfiles/git/gitconfig.*
done

echo "Remove git signing key ..."
find .dotfiles/ -type f -name 'gitconfig*' -exec sed -i 's/signingkey = .*//g' {} \;
