## Dotfile

### About
Very very simple setup to use zsh + vim for python.  
I'll add some settings if I feel like it.  


### How to install
#### 1.clone this repository
    $ git clone https://github.com/fujiso/dotfile.git
    $ cd ./dotfile
    $ git submodule init
    $ git submodule update

#### 2.install submodules...(see each repository) 
* prezto 
 
    $ zsh  
    $ mv ./submodule/prezto/* ~/.zprezto/

create the zsh configuration.  
    
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
    
set zsh as default shell  

    $ chsh -s /bin/zsh

#### 3.setup  

    $ sh ./setup.sh
 
