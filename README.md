## Dotfile

### About
Very very simple setup to use zsh + vim for python.  
I'll add some settings if I feel like it.  


### How to install
#### 1.setup
Clone this repository and execute setup.sh.

```shell
    $ git clone https://github.com/fujiso/dotfile.git
    $ cd ./dotfile
    $ sh ./setup.sh
```

You can install prezto(zsh framework) and anaconda3.

#### 2.install software
* powerline font
    Change commandline font config to powerline font in order not to occur misconversion.   
    I recommend "Meslo LG M Regular for Powerline"   

    Fontdatas are here:  
    ``$ ./dotfile/submodules/powerline``  

* dein.vim
    customize and use extentions of vim.
    i) install dein.vim
'''
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh {specify the installation directory}
'''

    ii) Add a postscript to your .vimrc like this.  
        {path to dein.vim directory} and {path to plugin base path directory} are shown when you run installer.sh.  
'''
if &compatible
    set nocompatible
endif
set runtimepath+={path to dein.vim directory}

if dein#load_state({path to plugin base path directory})
    call dein#begin({path to plugin base path directory})

    call dein#add({path to dein.vim directory})
    call dein#add('Shougo/neocomplete.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
    call dein#add('scrooloose/syntastic', {'on_ft': 'python'})
    call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})
    ...
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable
'''


#### 3. activate changes
    $ zsh

#### get submodules
    $ git submodule init
    $ git submodule update
