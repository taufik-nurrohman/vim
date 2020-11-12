let g:current_theme = 'sunburst'

" Set default encoding
set encoding=utf-8

" Show line number(s)
set number
set ruler

" Enable line wrap
set wrap

" Show command(s)
set showcmd

" Do not `hlsearch` until I press <ENTER>
set noincsearch

set hlsearch
set ignorecase
set smartcase

" Indent with 2 space(s)
set tabstop=2
set shiftwidth=2

" Automatic indentation
set smarttab
set expandtab

set wildmenu

set autoread

set history=1000

" Immediately scroll before reaching edge
set scrolloff=8
set sidescroll=1
set sidescrolloff=15

set mouse=a

set title
set nocompatible

set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm
set term=xterm-256color

filetype plugin indent on
syntax on

set background=dark

execute 'colorscheme ' . g:current_theme

let NERDTreeDirArrows = 1

" Hide help text and up level description
" To up one level directory, press <U>
let NERDTreeMinimalUI = 1

" Close `NERDTree` on file open
"let NERDTreeQuitOnOpen = 1

" Show hidden file(s)
let NERDTreeShowHidden = 1

" Hide these file(s) from the tree
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store
let NERDTreeRespectWildIgnore = 1

" Dummy variable
autocmd StdInReadPre * let s:std_in = 1
" Automatically open `NERDTree` when vim starts up with no file specified
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Automatically open `NERDTree` on file open, then focus to the file contents
autocmd VimEnter * if argc() != 0 && !exists('s:std_in') | NERDTree | wincmd p | endif
" Automatically close `NERDTree` on last file close
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | q | endif

" Buggy :(
let g:strip_whitespace_on_save = 1
let g:strip_whitelines_on_eof = 1
let g:strip_whitespace_confirm = 0
autocmd VimEnter * EnableWhitespace
autocmd VimEnter * EnableStripWhitespaceOnSave

" Toggle `NERDTree` with <CTRL>+<N>
map <silent> <C-N> :NERDTreeToggle<CR>

" Clear search marker and reload color scheme with <CTRL>+<L>
nnoremap <silent> <C-L> :nohlsearch <BAR> call ReloadColorScheme()<CR><C-L>
function! ReloadColorScheme()
    execute 'colorscheme ' . g:current_theme
endfunction

execute pathogen#infect()
