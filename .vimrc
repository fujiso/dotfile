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

" pythonテンプレート
autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt

if &compatible
    set nocompatible               " Be iMproved
endif

"コード編集設定
filetype plugin indent on  "ファイル形式別プラグイン有効化
syntax enable              "シンタックスハイライト

