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

" Indent with 4 space(s)
set softtabstop=4
set tabstop=4
set shiftwidth=4

" Open split(s) to the bottom and/or right
set splitbelow
set splitright

" Indent with 2 space(s) for specific file type(s)
autocmd FileType css,html,jade,json,pug,scss,xml,yaml setlocal softtabstop=2 tabstop=2 shiftwidth=2

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
let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='-'

" Hide help text and up level description
" To up one level directory, press <U>
let NERDTreeMinimalUI = 1

" Close `NERDTree` on file open
"let NERDTreeQuitOnOpen=1

" Show hidden file(s)
let NERDTreeShowHidden = 1

" Hide these file(s) from the tree
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store
set wildignore+=composer.lock,node_modules,package-lock.json
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

" Toggle `NERDTree` with <CTRL+N>
map <silent> <C-N> :NERDTreeToggle<CR>

" Clear search marker on entering the insert mode
autocmd InsertEnter * :let b:_search=@/ | let @/=''
" Add previous search marker on leaving the insert mode
autocmd InsertLeave * :let @/=get(b:,'_search','')

" Clear search marker and reload color scheme with <CTRL>+<L>
nnoremap <silent> <C-L> :nohlsearch <BAR> call ReloadColorScheme()<CR><C-L><ESC>
function! ReloadColorScheme()
    execute 'colorscheme ' . g:current_theme
endfunction

" Navigate between split(s) with <CTRL+LEFT/DOWN/UP/RIGHT>
nnoremap <C-LEFT> <C-W>h
nnoremap <C-DOWN> <C-W>j
nnoremap <C-UP> <C-W>k
nnoremap <C-RIGHT> <C-W>l

" Enter terminal mode with <CTRL+SHIFT+T>
nnoremap <C-S-T> :term<CR>

" Exit terminal mode with <CTRL+SHIFT+T>
tnoremap <C-S-T> <C-W>:q!<CR>

" Navigate to other split(s) from terminal with <CTRL+LEFT/DOWN/UP/RIGHT>
tnoremap <C-LEFT> <C-W>h
tnoremap <C-DOWN> <C-W>j
tnoremap <C-UP> <C-W>k
tnoremap <C-RIGHT> <C-W>l
