set nocompatible

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