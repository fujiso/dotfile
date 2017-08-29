#!/bin/sh
# Execute at '$HOME/dotfiles'
dir=~/.vim; [ ! -e $dir ] && mkdir -p $dir
echo "setup prezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
ln -si ~/dotfile/.vimrc ~/.vimrc
ln -si ~/dotfile/colors ... ~/.vim/
ln -si ~/dotfile/.zshrc ~/.zshrc
ln -si ~/dotfile/.zpreztorc ~/.zpreztorc
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
latest=$(pyenv install -l | grep anaconda3 | tail -n 1)
pyenv install $latest
pyenv global $latest
echo "installed prezto & anaconda"
echo "setup finished!"
