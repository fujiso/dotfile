## Dotfile

### About
Very very simple setup to use zsh + vim for python.  
I'll add some settings if I feel like it.  


### How to install
#### 1.clone this repository
    $ git clone https://github.com/fujiso/dotfile.git
    $ cd ./dotfile
    $ git submodules init
    $ git submodules update

#### 2.setup  

    $ sh ./setup.sh

#### 3.install software
* anaconda  
    You can find latest version by tab-completion after typing "anaconda3-".
    anaconda3-4.4.0 is available.(8/29/2017)
    $ pyenv install anaconda3-(latest version)
    $ pyenv global anaconda3-(latest version)

* powerline font
    Change commandline font config to powerline font in order not to occur misconversion.

    Fontdata is here:
    $ ./dotfile/submodules/powerline

#### 4. activate change
    $ zsh
