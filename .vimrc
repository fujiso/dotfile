set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp

inoremap <silent> jj <ESC>

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

"改行コード設定
set fileformats=unix,dos,mac

"表示設定
set number          "行数表示
set nowrap          "折り返し無し
set ruler           "カーソル位置を表示
set cursorline      " カーソルラインをハイライト
set textwidth=0     "自動的に改行が入るのを無効化
set showcmd         "入力中のコマンドを表示
set title           "編集中のファイル名を表示
set showmatch       "対応するカッコを強調表示
set matchtime=1     "対応するカッコを強調表示時の時間を設定
set laststatus=2    "ステータス行を常に表示
set showtabline=2   "タブのラベルを表示
set showmode        "現在のモードを表示
set ambiwidth=double " □や○文字が崩れる問題を解決
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


"補完設定
set completeopt=menu
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

"カレントディレクトリ設定(自動的に開いたファイルのディレクトリに移動)
if exists('+autochdir')
  set autochdir
endif

"クリップボード設定
set clipboard+=unnamedplus
"set clipboard=unnamed,autoselect
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

"マウス有効化
"if has('mouse')
"    set mouse=a
"    if has('mouse_sgr')
"        set ttymouse=sgr
"    elseif v:version > 703 || v:version is 703 && has('patch632')
"        set ttymouse=sgr
"    else
"        set ttymouse=xterm2
"    endif
"endif

"コピペ時の自動インデントを消す
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" make, grep などのコマンド後に自動的にQuickFixを開く
autocmd  QuickfixCmdPost make,grep,grepadd,vimgrep copen

" QuickFixおよびHelpでは q でバッファを閉じる
autocmd  FileType help,qf nnoremap <buffer> q <C-w>c

let g:python3_host_prog = '$HOME/.pyenv/shims/python'
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'ujihisa/neco-look'
Plug 'jacoborus/tender'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"ファイルオープン関連
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'scrooloose/nerdtree'
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
Plug 'Shougo/vimshell', { 'rev': '3787e5' }
call plug#end()

" airline設定
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'
set laststatus=2

"背景色設定
colorscheme tender
"set t_Co=256
"コード編集設定
filetype plugin indent on  "ファイル形式別プラグイン有効化
syntax enable              "シンタックスハイライトneco-vim
