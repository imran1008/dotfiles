filetype plugin on
syntax on

set rtp^=/usr/share/vim/vimfiles/

set et
set cin
set ru
set bs=indent,eol,start

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set smartcase           " Do smart case matching
set incsearch           " Incremental Search
set autowrite           " Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes) in terminals
set number              " Turn on line numbers
set backspace=2         " Make backspace work normal
set noerrorbells        " Don't make noise
set novisualbell        " Don't blink
set background=dark
set ai                  " Autoindent
set si                  " Smartindent
set cindent             " Do C-Style Indenting
set tabstop=4           " Tab spacing (settings below are just to unify it)
set softtabstop=4       " Unify
set shiftwidth=4        " Unify
set noexpandtab         " Real Tabs
set nowrap              " Do not wrap lines
set hlsearch            " Highlight search results
set swapsync=""         " Enable async swap file
set modeline
set modelines=5
set laststatus=2
set relativenumber
set number

au BufNewFile,BufRead *.php set wrap
au BufNewFile,BufRead Makefile set noexpandtab

let g:syntastic_c_checkers = []
let &colorcolumn=join(range(121,121),",")

" Colors
colors delek
hi LineNr ctermfg=Blue guifg=Brown

""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""

noremap f e
noremap p r
noremap b t
noremap j y
noremap l u
noremap u i
noremap y o
noremap ; p
noremap r s
noremap s d
noremap t f
noremap m h
noremap n j
noremap e k
noremap i l
noremap o ;
noremap d v
noremap v b
noremap k n
noremap h m

noremap F E
noremap P R
noremap B T
noremap J Y
noremap L U
noremap U I
noremap Y O
noremap : P
noremap R S
noremap S D
noremap T F
noremap M H
noremap N J
noremap E K
noremap I L
noremap O :
noremap D V
noremap V B
noremap K N
noremap H M

nnoremap <C-f> <C-e>
nnoremap <C-p> <C-r>
nnoremap <C-b> <C-t>
nnoremap <C-j> <C-y>
nnoremap <C-y> <C-o>
nnoremap <C-;> <C-p>
nnoremap <C-r> <C-s>
nnoremap <C-s> <C-d>
"nnoremap <C-t> <C-f>
nnoremap <C-n> <C-j>
nnoremap <C-e> <C-k>
nnoremap <C-o> <C-;>
nnoremap <C-d> <C-v>
nnoremap <C-v> <C-b>
nnoremap <C-k> <C-n>


noremap <C-W>m <C-W>h
noremap <C-W>n <C-W>j
noremap <C-W>e <C-W>k
noremap <C-W>i <C-W>l



