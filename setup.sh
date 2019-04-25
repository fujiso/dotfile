#!/bin/bash
# setup script for Ubuntu OS
# setup zsh
# Execute at '$HOME/dotfiles'
CONF=~/.zshrc
dir=~/.vim; [ ! -e $dir ] && mkdir -p $dir
dir=~/.config/nvim; [ ! -e $dir ] && mkdir -p $dir

echo "setup prezto..."
if [ ! -e ~/.zprezto ]
then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

echo "link config file..."
DOT_FILES=(.vimrc .zshrc .zpreztorc .tmux.conf init.vim colors)
DOT_DIR=($HOME $HOME $HOME $HOME $HOME/.config/nvim $HOME/.vim)
for i in `seq 0 $((${#DOT_FILES[@]}-1))`
do
    _DIR=${DOT_DIR[$i]}
    _FILE=${DOT_FILES[$i]}
    if [ -e $_DIR/$_FILE ]; then
        echo "$_DIR/$_FILE is already exists. moved original file to $_DIR/$_FILE.cp"
        mv $_DIR/$_FILE $_DIR/$_FILE.cp
    fi
    ln -sf ./$_FILE $_DIR/$_FILE
done


echo "setup linuxbrew..."
brew doctor > /dev/null 2>&1
if [ $? -eq 127 ]; then
    echo "install lnuxbrew"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >> $CONF
    echo 'export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"' >> $CONF
    echo 'export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"' >> $CONF
    source $CONF
else
    echo "linuxbrew is already installed"
fi

echo "setup pyenv..."
pyenv -v > /dev/null 2>&1
if [ $? -eq 127 ]; then
    echo "install pyenv..."
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $CONF
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $CONF
    echo 'eval "$(pyenv init -)"' >> $CONF
    source $CONF
else
    echo "pyenv is already installed"
fi


echo "setup anaconda..."
latest=$(~/.pyenv/bin/pyenv install -l | grep anaconda3 | tail -n 1)
echo "install latest anaconda version: $latest"
~/.pyenv/bin/pyenv install $latest
~/.pyenv/bin/pyenv global $latest

echo "setup nvim..."
nvim -v > /dev/null 2>&1
if [ $? -eq 127 ]; then
    echo "intstall neovim"
    brew install neovim
fi
# vim-plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vim-plug for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +":PlugInstall" +:q +:q
vim +":PlugInstall" +:q +:q

echo "Setup finished!"
echo "Please restart shell."

