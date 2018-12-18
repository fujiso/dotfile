#!/bin/sh
# Execute at '$HOME/dotfiles'
dir=~/.vim; [ ! -e $dir ] && mkdir -p $dir
echo "setup prezto..."
if [ ! -e ~/.zprezto ]
then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

echo "link config file..."
ln -si .vimrc ~/.vimrc
ln -si colors ... ~/.vim/
ln -si .zshrc ~/.zshrc
ln -si .zpreztorc ~/.zpreztorc
ln -si .tmux.conf ~/.tmux.conf

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

