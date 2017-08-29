#!/bin/sh
# Execute at '$HOME/dotfiles'
dir=~/.vim; [ ! -e $dir ] && mkdir -p $dir
echo "setup prezto..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
ln -si ~/dotfile/.vimrc ~/.vimrc
ln -si ~/dotfile/colors ... ~/.vim/
ln -si ~/dotfile/.zshrc ~/.zshrc
ln -si ~/dotfile/.zpreztorc ~/.zpreztorc
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
zsh
echo "setup finished!"
