" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

let mapleader = ","
let g:mapleader = ","
noremap \ ,

syntax on
filetype plugin indent on
set encoding=utf8
set ffs=unix,dos,mac

set autowrite

set number relativenumber
set so=10
set cursorline

set splitbelow splitright

set list listchars=tab:>.,trail:.,extends:#,nbsp:.
set hidden
set matchpairs+=<:>

set t_Co=256
let g:rehash256 = 1
set background=dark
colorscheme Mustang

set cm=blowfish2 "encrypt a file using the :X command (vim +X sensitive_file.md)

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

" JS configuration
"
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\ },
\}


"
" Go(lang) configuration
augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

let g:go_fmt_command = "goimports"
let g:go_list_type   = "quickfix"

" use Gopls
" with vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
"with Ale
let g:ale_linters = {
  \ 'go': ['gopls'],
  \}

set updatetime=300
let g:go_auto_type_info = 1 " automatically display function signature in status line
let g:go_auto_sameids = 1 " automatically highlight all matching identifiers (vars, funcs, etc.)


let php_var_selector_is_identifier=1 " force php dollar sign to the same colour as it's variable name

function! PhpSyntaxOverride()
	hi! def link phpDocTags  phpDefine
	hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
	autocmd!
	autocmd FileType php call PhpSyntaxOverride()
augroup END

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
