set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdtree'
Plugin 'python-mode/python-mode'

call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible      " We're running Vim, not Vi!
set noswapfile
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2

set clipboard=unnamed

" start NERDTree for directories
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

let g:pymode_python = 'python3'
let g:pymode_folding = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_config = "$HOME/.pylint.rc"
let g:pymode_options_max_line_length = 120
