#!/bin/bash
curl https://pyenv.run | bash

sudo apt-get install -y build-essential libbz2-dev zlib1g-dev libssl-dev libssl-dev libreadline-dev libsqlite3-dev

# add to path in this shell to avoid full paths in subsequent commands
"$HOME"/.pyenv/bin/pyenv doctor
prepend_path "${HOME}/.pyenv/bin"
prepend_path "$(pyenv root)/shims"

# install some python versions
pyenv install 3.6.8
pyenv install 2.7.15
pyenv global 3.6.8
pyenv rehash

# install packages
python -m pip install --upgrade pip
pip install pipenv
pip install pylint
pip install flake8
pyenv rehash
