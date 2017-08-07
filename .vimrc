set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp

"改行コード設定
set fileformats=unix,dos,mac

"表示設定
set number          "行数表示
set nowrap          "折り返し無し
set ruler           "カーソル位置を表示
set textwidth=0     "自動的に改行が入るのを無効化
set showcmd         "入力中のコマンドを表示
set title           "編集中のファイル名を表示
set showmatch       "対応するカッコを強調表示
set matchtime=1     "対応するカッコを強調表示時の時間を設定
set laststatus=2    "ステータス行を常に表示
set showtabline=2   "タブのラベルを表示
set showmode        "現在のモードを表示

"バックスペースキー使用設定
"set backspace=indent,eol,start

"バックアップファイル設定
set nowritebackup
set nobackup
set noswapfile
set noundofile

"タブ設定
set expandtab      "タブを半角空白として設定
set tabstop=8      "タブを半角スペース8文字として表示(pythonのインタプリタはタブ文字を8文字として扱う為)
set softtabstop=4  "タブ入力時半角スペース4文字として表示
set shiftwidth=4   "インデント時に半角スペース4文字として表示

"背景色設定
colorscheme tender
"set t_Co=256

"補完設定
set completeopt=menu

"カレントディレクトリ設定(自動的に開いたファイルのディレクトリに移動)
if exists('+autochdir')
  set autochdir
endif

"クリップボード設定
set clipboard=unnamed

"検索関連
set incsearch                   "インクリメンタルサーチ
set hlsearch                    "検索ハイライト
set wrapscan                    "行末まで検索した先頭に戻る
set smartcase                   "大文字と小文字を無視して検索(小文字時)
set ignorecase                  "大文字と小文字を無視して検索
noremap <Leader>nh :nohlsearch<CR> "検索ハイライト削除

"矩形選択設定
set virtualedit=block

"勝手にコメントアウトしない様に対応
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

" make, grep などのコマンド後に自動的にQuickFixを開く
autocmd  QuickfixCmdPost make,grep,grepadd,vimgrep copen

" QuickFixおよびHelpでは q でバッファを閉じる
autocmd  FileType help,qf nnoremap <buffer> q <C-w>c

if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
let s:dein_dir = expand('~/.vim/./bundles')
let s:repos_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
set runtimepath+=s:repos_dir

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:repos_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:repos_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:repos_dir, ':p')
endif

" Required:
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " Let dein manage dein
    " Required:
    call dein#add(s:repos_dir)
    let s:toml_dir  = $HOME . '/.vim/bundles'
    let s:toml = s:toml_dir . '/dein.toml'
    let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
    " Let dein manage dein
    " Add or remove your plugins here:

    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('scrooloose/syntastic', {'on_ft': 'python'})
    " You can specify revision/branch/tag.
    call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
    let g:syntastic_python_checkers = ['pyflakes', 'pep8']
    " Required:
    call dein#end()
    call dein#save_state()
endif
" If you want to install not installed plugins on
" startup.
if dein#check_install()
    call dein#install()
endif

"コード編集設定
filetype plugin indent on  "ファイル形式別プラグイン有効化
syntax enable              "シンタックスハイライト
