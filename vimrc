" Golang support

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=$GOROOT/misc/vim

call pathogen#infect()

syntax on
filetype plugin indent on
set enc=utf8

" Tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch
set showmatch

" Misc
colorscheme delek
set clipboard=unnamed   " yank to the system register (*) by default
set showmatch           " Cursor shows matching ) and }
set showmode            " Show current mode
set wildchar=<TAB>      " start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu
"set wildmode=list:longest

if exists('+relativenumber')
    set relativenumber " support only in Vim 7.3 and later
else
    set nu
endif

if exists('+undofile')
    set undofile " support only in Vim 7.3 and later
endif

"set cursorline
set smartindent
set autoindent
set copyindent

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

" shortcut to cmd-line
nnoremap ; :
" switch off search highlight
nnoremap <leader><space> :noh<CR>
" Select what's just pasted
nnoremap <leader>v V`]
" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" toggle Tagbar
nmap <leader>t :TagbarToggle<CR>

" toggle NERDTree
nmap <leader>n :NERDTreeToggle<CR>

" <C-a> conflicts with gnu-screen default shortcut
nmap <leader>a <C-a>

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" --- move around splits {
" move to and maximize the below split
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others
set wmh=0                     " set the min height of a window to 0 so we can maximize others
" }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Programming related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Margin line
if exists('+colorcolumn')
    set colorcolumn=80
else
    highlight OverLength ctermbg=darkred ctermfg=white guibg=#f9d9d9
    match OverLength /\%81v.\+/
    "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" Support only in Vim 7.3 and later
"set wrap
"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=85

" Ctrl-[ jump out of the tag stack (undo Ctrl-])
map <C-[> <ESC>:po<CR> ]

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


" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set focus to TagBar when opening it
let g:tagbar_autofocus = 1

""""""""""""""""
" For Powerline
set nocompatible
set laststatus=2
set t_Co=256
"let g:Powerline_symbols = 'fancy'

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

