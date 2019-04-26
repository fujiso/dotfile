#!/bin/bash
# setup script for Ubuntu OS
# setup zsh
# Execute at '$HOME/dotfiles'
CONF=~/.zshrc
CURRENT=`pwd`
dir=~/.vim; [ ! -e $dir ] && mkdir -p $dir
dir=~/.config/nvim; [ ! -e $dir ] && mkdir -p $dir

echo "setup prezto..."
if [ ! -e ~/.zprezto ]
then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    for rcfile in `ls $HOME/.zprezto/runcoms/ | egrep -v "^README.md"`; do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
fi

echo "link config file..."
DOT_FILES=(.vimrc .zshrc .zpreztorc .tmux.conf init.vim colors .tmux)
DOT_DIR=($HOME $HOME $HOME $HOME $HOME/.config/nvim $HOME/.vim $HOME)
for i in `seq 0 $((${#DOT_FILES[@]}-1))`
do
    _DIR=${DOT_DIR[$i]}
    _FILE=${DOT_FILES[$i]}
    if [ -e $_DIR/$_FILE ]; then
        echo "$_DIR/$_FILE is already exists. moved original file to $_DIR/$_FILE.cp"
        mv $_DIR/$_FILE $_DIR/$_FILE.cp
    fi
    ln -sf $CURRENT/$_FILE $_DIR/$_FILE
done



echo "setup pyenv..."
dddpyenv -v > /dev/null 2>&1
if [ $? -eq 127 ]; then
    echo "install pyenv..."
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    git clone git://github.com/yyuu/pyenv-update.git ~/.pyenv/plugins/pyenv-update
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $CONF
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $CONF
    echo 'eval "$(pyenv init -)"' >> $CONF
    source $CONF
else
    echo "pyenv is already installed"
fi


echo "setup anaconda..."
latest=$(pyenv install -l | grep anaconda3 | tail -n 1)
echo "install latest anaconda version: $latest"
PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $latest
pyenv global $latest

echo "setup linuxbrew..."
dddbrew > /dev/null 2>&1
if [ $? -eq 127 ]; then
    echo "install lnuxbrew"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    echo 'export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"' >> $CONF
    echo 'export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"' >> $CONF
    echo 'export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"' >> $CONF
    source $CONF
else
    echo "linuxbrew is already installed"
fi

#brew install emacs

echo "setup nvim..."
nvim -v > /dev/null 2>&1
if [ $? -eq 127 ]; then
    echo "intstall neovim"
    brew install neovim
fi
# vim-plug for vim
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vim-plug for neovim
curl -fLo $HOME/.nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +":PlugInstall" +:qall
# vim +":PlugInstall" +:qall
cd $HOME/.nvim/plugged/YouCompleteMe/
python ./install.py

echo "Setup finished!"
echo "Please restart shell."

