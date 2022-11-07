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
set ai                  " Auto indentation
set si                  " Smart indentation
set cindent             " Do C-Style Indenting
set tabstop=4           " Tab spacing (settings below are just to unify it)
set softtabstop=4       " Unify
set shiftwidth=4        " Unify
set noexpandtab         " Real Tabs
set nowrap              " Do not wrap lines
set hlsearch            " Highlight search results
set modeline
set modelines=5
set laststatus=2
set relativenumber     " Relative line numbers

au BufNewFile,BufRead *.php    set wrap
au BufNewFile,BufRead *.txt    set spell spelllang=en
au BufNewFile,BufRead *.md     set spell spelllang=en
au BufNewFile,BufRead *.muttrc set filetype=muttrc

let g:syntastic_c_checkers = []
let &colorcolumn=join(range(101,101),",")
let mapleader = ' '

""""""""""""""""""""""""""""""""
" => Global settings
""""""""""""""""""""""""""""""""
syntax on


""""""""""""""""""""""""""""""""
" => Dracula theme
""""""""""""""""""""""""""""""""
" Override default settings in plugin
"let dracula_palette = dracula#palette
"let dracula_palette.comment = ['#6272A4', 60]

" Apply color scheme
colorscheme dracula
let g:lightline = { 'colorscheme': 'darcula' }

" Override color settings after plugin is applied
hi Normal guibg=NONE ctermbg=NONE            " transparent background
hi LineNr ctermfg=Blue                       " blue line numbers
hi Comment ctermfg=Gray                      " comment color
hi Search ctermfg=Black ctermbg=LightMagenta " search highlight
"hi TabLineFill ctermfg=Green


""""""""""""""""""""""""""""""""
" => VimWiki
""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_key_mappings =
\ {
\   'all_maps': 1,
\   'global': 1,
\   'headers': 1,
\   'text_objs': 1,
\   'table_format': 1,
\   'table_mappings': 1,
\   'lists': 0,
\   'links': 1,
\   'html': 1,
\   'mouse': 0,
\ }

let g:vimwiki_autowriteall = 0
set nocompatible
filetype plugin on

""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""
lua require('init')

set completeopt=menu,menuone,noselect


""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""

" Remapping colemak-dhm to qwerty
" The reason being that the original keybindings in vim were optimized for
" qwerty. For example, the h, j, k, l keys for arrow navigation are all in the
" home row in qwerty, which is super handy. colemak-dhm only shines when you
" have to type a word so, I kept it only for insert mode.

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

" For split screen navigation
noremap <C-W>m <C-W>h
noremap <C-W>n <C-W>j
noremap <C-W>e <C-W>k
noremap <C-W>i <C-W>l

" Normally, page down is Ctrl-D and page up is Ctrl-U
" It makes sense in a way because the first letter of the
" direction is used as the key.
"
" I think it makes more sense to use Ctrl-L for page down
" and leave the ajacent key (in colemak-dhm) Ctrl-U for page
" up.
nnoremap <C-l> <C-d>

" Use Ctrl-N for new tab
nmap <C-n> Otabnew<enter>
nmap <C-w>l Otabp<enter>
nmap <C-w>u Otabn<enter>

""""""""""""""""""""""""""""""""
" => LSP
""""""""""""""""""""""""""""""""
nnoremap <leader>vd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <leader>vi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>vsh <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <leader>vrr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <leader>vrn <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>vh <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <leader>vca <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>vn <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <leader>vll <cmd>call LspLocationList()<cr>

""""""""""""""""""""""""""""""""
" => Telescope
""""""""""""""""""""""""""""""""

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

""""""""""""""""""""""""""""""""
" => Vifm
""""""""""""""""""""""""""""""""
"nnoremap <leader>vv <cmd>Vifm<cr>
"nnoremap <leader>vv <cmd>VsplitVifm<cr>
"nnoremap <leader>vs <cmd>SplitVifm<cr>
"nnoremap <leader>vd <cmd>DiffVifm<cr>
"nnoremap <leader>vt <cmd>TabVifm<cr>

""""""""""""""""""""""""""""""""
" => Harpoon
""""""""""""""""""""""""""""""""
nnoremap <leader>ha <cmd>lua require('harpoon.mark').add_file()<cr>
nnoremap <leader>hh <cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>
nnoremap <leader>a <cmd>lua require('harpoon.ui').nav_file(1)<cr>
nnoremap <leader>r <cmd>lua require('harpoon.ui').nav_file(2)<cr>
nnoremap <leader>s <cmd>lua require('harpoon.ui').nav_file(3)<cr>
nnoremap <leader>t <cmd>lua require('harpoon.ui').nav_file(4)<cr>
nnoremap <leader>hn <cmd>lua require('harpoon.ui').nav_next()<cr>
nnoremap <leader>he <cmd>lua require('harpoon.ui').nav_prev()<cr>


""""""""""""""""""""""""""""""""
" => Terminal
""""""""""""""""""""""""""""""""
nnoremap <leader>p <cmd>term<cr>
tnoremap <Esc><Esc> <C-\><C-n>



