#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "No argument supplied! Choose your setup!"
    echo "[None, WSL, Linux, CLIC, Android, Centos]"
    exit 1
else
    OS="$1"
fi


# Create trash and tmp directory
mkdir -p "$HOME/trash"
mkdir -p "$HOME/.cache/tmp"

# Get current dir (so you can run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlink directories
ln -sfvT "$DOTFILES_DIR/atom" ~/.atom
ln -sfvT "$DOTFILES_DIR/duply" ~/.duply
ln -sfvT "$DOTFILES_DIR/jupyter" ~/.jupyter

# Symlink all files with symlink extensions
while IFS= read -r -d '' file
do
  filename=$(basename "$file")
  filename="${filename%.*}"
  ln -sfv "$file" "$HOME/.$filename"
done <   <(find "$DOTFILES_DIR" -name '*.symlink' -print0)

# special symlinks
ln -sfv "$DOTFILES_DIR"/ssh/config ~/.ssh/config
ln -sfv "$DOTFILES_DIR"/ipython/ipython_config.py ~/.ipython/profile_default/ipython_config.py
mkdir -p "$HOME"/.config/mssqlcli
ln -sfv "$DOTFILES_DIR"/mssql/config ~/.config/mssqlcli/config
mkdir -p "$HOME"/.config/ranger
ln -sfv "$DOTFILES_DIR"/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sfv "$DOTFILES_DIR"/ranger/scope.sh ~/.config/ranger/scope.sh
ln -sfv "$DOTFILES_DIR"/ranger/rifle.conf ~/.config/ranger/rifle.conf

# Link specific local rc files
echo "Loading local dotfiles specific for $OS"
if [ "$OS" == "WSL" ]; then
    ln -sfv "$DOTFILES_DIR/zsh/zshrc_WSL.zsh" ~/.zshrc_local
elif [ "$OS" == "Linux" ]; then
    ln -sfv "$DOTFILES_DIR/zsh/zshrc_Linux.zsh" ~/.zshrc_local
    "$DOTFILES_DIR"/gnome/set_keybindings.sh
    echo "You might have to execute 'echo \"source ~/.bash_profile\" >> /etc/bash.bashrc'"
elif [ "$OS" == "CLIC" ]; then
    ln -sfv "$DOTFILES_DIR/zsh/zshrc_CLIC.zsh" ~/.zshrc_local
    "$DOTFILES_DIR"/sublime/setup.sh
elif [ "$OS" == "Android" ]; then
    ln -sfv "$DOTFILES_DIR/zsh/zshrc_Android.zsh" ~/.zshrc_local
elif [ "$OS" == "Centos" ]; then
    ln -sfv "$DOTFILES_DIR/zsh/zshrc_Centos.zsh" ~/.zshrc_local
else
    echo "Error: unknown platform specified."
    exit 1
fi
