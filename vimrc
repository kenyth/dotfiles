call pathogen#infect()

syntax on
filetype plugin indent on
set enc=utf8

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
      autocmd Filetype *
                    \ if &omnifunc == "" |
                    \         setlocal omnifunc=syntaxcomplete#Complete |
                    \ endif
endif

""""""""""""""""
" For Powerline
set nocompatible
set laststatus=2
set t_Co=256
"let g:Powerline_symbols = 'fancy'

