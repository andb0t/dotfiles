#!/usr/bin/env bash

LOCAL_FILE=""
if [ -z "$1" ]; then
    echo "No argument supplied! Choose your setup!"
    echo "[None, WSL, Linux, CLIC, Android, Centos]"
    exit
else
    LOCAL_FILE="$1"
fi


# Create trash and tmp directory
mkdir -p "$HOME/trash"
mkdir -p "$HOME/.cache/tmp"

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlink directories
ln -sfvT "$DOTFILES_DIR/atom" ~/.atom
ln -sfvT "$DOTFILES_DIR/duply" ~/.duply
ln -sfvT "$DOTFILES_DIR/jupyter" ~/.jupyter

# Symlink all files with symlink extensions
for file in $(find $DOTFILES_DIR -name '*.symlink'); do
    filename=$(basename "$file")
    filename="${filename%.*}"
    ln -sfv $file ~/.$filename
done

# special symlinks
ln -sfv "$DOTFILES_DIR"/ssh/config ~/.ssh/config
ln -sfv "$DOTFILES_DIR"/ipython/ipython_config.py ~/.ipython/profile_default/ipython_config.py 
mkdir -p $HOME/.config/mssqlcli
ln -sfv "$DOTFILES_DIR"/mssql/config ~/.config/mssqlcli/config
mkdir -p $HOME/.config/ranger
ln -sfv "$DOTFILES_DIR"/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sfv "$DOTFILES_DIR"/ranger/scope.sh ~/.config/ranger/scope.sh

# Link specific local rc files
echo "Loading local dotfiles specific for $LOCAL_FILE"
if [ "$1" == "WSL" ]; then
    ln -sfv "$DOTFILES_DIR/zsh/zshrc_WSL" ~/.zshrc_local
elif [ "$1" == "Linux" ]; then
    ln -sfv "$DOTFILES_DIR/zsh/zshrc_Linux" ~/.zshrc_local
    "$DOTFILES_DIR"/gnome/set_keybindings.sh
    echo "You migh have to execute 'echo \"source ~/.bash_profile\" >> /etc/bash.bashrc'"
elif [ "$1" == "CLIC" ]; then
    ln -sfv "$DOTFILES_DIR/zsh/zshrc_CLIC" ~/.zshrc_local
    "$DOTFILES_DIR"/sublime/setup.sh
elif [ "$1" == "Android" ]; then
    ln -sfv "$DOTFILES_DIR/zsh/zshrc_Android" ~/.zshrc_local
    . "$DOTFILES_DIR/install/termux-api.sh"
elif [ "$1" == "Centos" ]; then
    ln -sfv "$DOTFILES_DIR/zsh/zshrc_Centos" ~/.zshrc_local
else
    echo "Error: unknown platform specified."
    exit 1
fi

