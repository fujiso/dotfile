
let g:python_host_prog = expand('$HOME/.pyenv/shims/python2.7')
let g:python3_host_prog = expand('$HOME/.pyenv/shims/python')
"let g:loaded_python_provider = 1
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '${HOME}/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_max_num_candidates = 20
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_key_list_stop_completion = ['<Enter>', '<C-y>']
set splitbelow
"Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
"let g:jedi#use_tabs_not_buffers = 1
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

"Plug 'w0rp/ale'
"let g:ale_sign_column_always = 1
"let g:airline#extensions#ale#enabled = 1
"autocmd vimenter* highlight clear ALEWarningSign
" Check Python files with flake8 and pylint.
"let b:ale_linters = {
"            \ 'python':['flake8'],
"            \}

" Fix Python files with autopep8 and yapf.
" let b:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
" let b:ale_warn_about_trailing_whitespace = 0

Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'ujihisa/neco-look'
Plug 'jacoborus/tender'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'lambdalisue/vim-rplugin'

Plug 'Yggdroot/indentLine'
let g:indentLine_char = '¦'

"ファイルオープン関連
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
"Plug 'Shougo/vimfiler'
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>

"nerdtree設定
nnoremap <C-t> :NERDTreeTabsToggle<CR>
"自動起動自動終了
autocmd vimenter * NERDTree
autocmd vimenter  * wincmd l
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"vimfiler設定
"let g:vimfiler_as_default_explorer = 1
"nnoremap <C-t> :VimFiler -split -simple -winwidth=35 -no-quit<CR>
"自動起動自動終了
"autocmd vimenter * VimFiler -split -simple -winwidth=35 -no-quit
"autocmd vimenter  * wincmd l
"autocmd bufenter * if (winnr("$") == 1 && exists("b:VimFiler") && b:VimFiler.isTabTree()) | q | endif

Plug 'Shougo/vimshell', { 'rev': '3787e5' }
call plug#end()

" airline設定
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'
set laststatus=2

"背景色設定
colorscheme tender
