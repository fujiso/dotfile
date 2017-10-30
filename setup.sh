#!/bin/sh
# Execute at '$HOME/dotfiles'
dir=~/.vim; [ ! -e $dir ] && mkdir -p $dir
echo "setup prezto..."
if [ ! -e ~/.zprezto ]
then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi
echo "link config file..."
ln -si ~/dotfile/.vimrc ~/.vimrc
ln -si ~/dotfile/colors ... ~/.vim/
ln -si ~/dotfile/.zshrc ~/.zshrc
ln -si ~/dotfile/.zpreztorc ~/.zpreztorc
if [ ! -e ~/.pyenv ]
then
    echo "setup pyenv..."
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi
echo "setup anaconda..."
latest=$(~/.pyenv/bin/pyenv install -l | grep anaconda3 | tail -n 1)
~/.pyenv/bin/pyenv install $latest
~/.pyenv/bin/pyenv global $latest
echo "Installed prezto & anaconda."
echo "Setup finished!"
echo "Please restart shell."

