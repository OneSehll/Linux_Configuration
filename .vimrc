set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'auto-pairs'
Plugin 'Yggdroot/indentLine'

"Yggdroot/indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'


"Auto-Pairs
"let g:AutoPairsFlyMode = 1

"YCM
let g:ycm_python_binary_path = 'python'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>gt :YcmCompleter GoTo<CR> 
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>

"Ale
let g:ale_linters={'python': ['pylint']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

"AirLine#####################################################
let g:airline#extensions#tabline#show_buffers = 1
"显示切换buffer和tab
let g:airline#extensions#tabline#enabled = 1
"powerline主题
let g:airline_powerline_fonts = 0
"显示buffer顺序
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

"NerdTree####################################################
let NERDTreeMinimalUI=1     "去除第一行的帮助提示
let NERDTreeWinSize=30
let NERDTreeHighlightCursorline=0
let NERDTreeChDirMode = 2
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
autocmd vimenter * NERDTree
nmap <F2> :NERDTreeToggle<CR>

"Tagbar######################################################
let g:tagbar_width=30
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_iconchars = ['▸', '▾']
nmap <F3> :TagbarToggle<CR>
autocmd VimEnter * nested :TagbarOpen

call vundle#end()            " required
filetype plugin indent on    " required
autocmd FileType python setlocal omnifunc=python3complete#Complete

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
set encoding=utf-8
set background=dark
colorscheme solarized
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
set laststatus=2
set completeopt-=preview
"set nu
"set hlsearch
"关闭上下左右
nmap <Up> <NOP>
nmap <Down> <NOP>
nmap <Left> <NOP>
nmap <Right> <NOP>
nmap 11 :NERDTreeFocus<CR>
nmap 22 :TagbarOpen j<CR>
"改变切换窗口方式
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
"回复上次打开的位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

if exists('$TMUX')
  set term=screen-256color
endif
