let config_dir = '~/.vim' " My ViM config directory

if empty(glob(config_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo ' . config_dir . '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall
endif


call plug#begin(config_dir . '/bundles')

"
" ViM Colors (theme)
Plug 'NLKNguyen/papercolor-theme'
Plug 'trusktr/seti.vim'
Plug 'dracula/vim'
Plug 'sickill/vim-monokai'
Plug 'croaker/mustang-vim'

"
" General
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'

"
" HTML
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'othree/html5-syntax.vim', { 'for': 'html' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'tpl'] }

Plug 'skammer/vim-css-color', { 'for': 'css' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'd0f/vim-css3', { 'for': 'css' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

"
" Go plugins
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'nsf/gocode', {'for': 'go'}
Plug 'garyburd/go-explorer', {'for': 'go'}
Plug 'dgryski/vim-godef', {'for': 'go'}

"
" PHP
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }

Plug 'evidens/vim-twig', {'for': 'twig' }

"
" Javascript
Plug 'pangloss/vim-javascript', {'for': 'js'}
Plug 'mxw/vim-jsx', {'for': 'js'}
Plug 'jbgutierrez/vim-babel', {'for': 'js'}

"
" Git
Plug 'airblade/vim-gitgutter', {}

call plug#end()

" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

let mapleader = ","
let g:mapleader = ","
noremap \ ,

syntax on
filetype plugin indent on
set encoding=utf8
set ffs=unix,dos,mac

set number
set relativenumber
set so=15

set list listchars=tab:>.,trail:.,extends:#,nbsp:.
set hidden
set matchpairs+=<:>

set t_Co=256
let g:rehash256 = 1
set background=dark
colorscheme PaperColor

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

let g:user_emmet_install_global = 0

" Return to last edit position when opening files (indispensable!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

augroup configgroup
	autocmd!
	autocmd VimEnter * highlight clear SignColumn
	autocmd FileType php setlocal expandtab
	autocmd FileType php setlocal list
	autocmd FileType php setlocal listchars=tab:+\ ,eol:-
	autocmd FileType php setlocal formatprg=par\ -w80\ -T4
	autocmd FileType html,css EmmetInstall
	autocmd BufEnter Makefile setlocal noexpandtab
	autocmd BufEnter *.sh setlocal tabstop=2
	autocmd BufEnter *.sh setlocal shiftwidth=2
	autocmd BufEnter *.sh setlocal softtabstop=2
	autocmd BufEnter,BufNewFile,BufRead *.html,*.tpl setlocal tabstop=2 shiftwidth=2 softtabstop=2
	autocmd BufNewFile,BufRead *.yaml,*.yml setf yaml
	autocmd BufNewFile,BufRead *.tpl setf html
	autocmd BufNewFile,BufRead *.install setlocal ft=php
	autocmd BufNewFile,BufRead *.module setlocal ft=php
	autocmd BufNewFile,BufRead *.inc setlocal ft=php
	autocmd BufNewFile,BufRead *.babelrc setlocal ft=json
augroup END

" Go(lang) configuration
augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

let g:go_fmt_command = "goimports"
let g:go_list_type   = "quickfix"


let php_var_selector_is_identifier=1 " force php dollar sign to the same colour as it's variable name

function! PhpSyntaxOverride()
	hi! def link phpDocTags  phpDefine
	hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
	autocmd!
	autocmd FileType php call PhpSyntaxOverride()
augroup END
