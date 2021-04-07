# install pyenv to easily install other python versions
choco install pyenv-win -y
refreshenv

# install some python versions
pyenv install -q 3.6.8
pyenv install -q 2.7.15
pyenv global 3.6.8
pyenv rehash

# install packages
python -m pip install --upgrade pip
pyenv rehash
pip install pipenv
pip install pylint
pip install flake8
pyenv rehash

refreshenv
