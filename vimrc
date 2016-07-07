set nocompatible

let config_dir = '~/.vim' " My ViM config directory

if empty(glob(config_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo ' . config_dir . '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall
endif


call plug#begin(config_dir . '/bundles')

" Go plugins
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'nsf/gocode', {'for': 'go'}

" PHP
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'evidens/vim-twig',

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

" Go(lang) configuration
let g:go_fmt_command = "goimports"
let g:go_list_type   = "quickfix"