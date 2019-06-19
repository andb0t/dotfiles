#!/bin/bash

echo "Sync files ..."
rsync -rE --exclude-from=rsync_exclude.txt --delete-excluded "$DOTFILES_DIR" .
