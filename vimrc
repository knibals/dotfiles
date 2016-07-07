set nocompatible

let config_dir = '~/.vim' " My ViM config directory

if empty(glob(config_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo ' . config_dir . '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall
endif


call plug#begin(config_dir . '/bundles')

" Go
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'nsf/gocode', {'for': 'go'}

call plug#end()

" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

let mapleader = ","
noremap \ ,

syntax on
filetype plugin indent on
set encoding=utf8
set ffs=unix,dos,mac

set number
set relativenumber
set so=5

set list listchars=tab:>.,trail:.,extends:#,nbsp:.
set hidden
set matchpairs+=<:>

set t_Co=256
let g:rehash256 = 1
colorscheme desert

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Return to last edit position when opening files (indispensable!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
