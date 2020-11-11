set number
set ruler

set showcmd

set noincsearch
set hlsearch
set ignorecase
set smartcase

set tabstop=2
set shiftwidth=2

set smarttab
set expandtab

set wildmenu

set encoding=utf-8

set autoread

set history=1000

set scrolloff=8
set sidescroll=1
set sidescrolloff=15

set mouse=a

set title

set nocompatible
filetype plugin indent on
syntax on

colorscheme sunburst

let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
"let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store
let NERDTreeRespectWildIgnore=1

autocmd BufEnter * if winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() | q | endif

map <silent> <C-N> :NERDTreeToggle<CR>
nnoremap <silent> <C-L> :nohlsearch <BAR> colorscheme sunburst<CR><C-L>

execute pathogen#infect()
