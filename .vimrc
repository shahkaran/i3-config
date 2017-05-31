cmap w!! w !sudo tee >/dev/null %
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
let g:vundle_default_git_proto = 'git'
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'git@github.com:scrooloose/nerdtree.git'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'Conque-Shell'
Plugin 'ervandew/supertab'
Plugin 'klen/python-mode'
Plugin 'rkulla/pydiction'

call vundle#end()            " required
filetype plugin indent on    " required
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
"
"

function RestartOdooWithUpdate()
	let fl = expand('%:p:h:t')
	execute "!sudo /bin/su - odoo -c '/opt/odoo/odoo_project_restart.sh ".fl."' &"
endfunction


nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>

nmap <F5> :call RestartOdooWithUpdate()<cr>

let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"
" "Linting
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes"
" " Auto check on save
"let g:pymode_lint_write = 1

" " Support virtualenv
let g:pymode_virtualenv = 1
"
" " Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
"
" " syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
" " Don't autofold code
let g:pymode_folding = 0


" COnfigure pydiction
"
let g:pydiction_location = '/home/karan/.vim/bundle/pydiction/complete-dict'


autocmd FileType php set omnifunc=phpcomplete#CompletePHP
