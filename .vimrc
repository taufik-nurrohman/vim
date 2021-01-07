" Set default color scheme
let g:skin = 'sunburst'

" Set leader key as `,`
let g:mapleader = ','

" Set default encoding
set encoding=utf-8

" Show line number(s)
set number

" Show file name and cursor position at the bottom bar
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

exec 'colorscheme ' . g:skin

let NERDTreeDirArrows = 1
let NERDTreeDirArrowExpandable = '+'
let NERDTreeDirArrowCollapsible = '-'

" Hide help text and up level description
" To up one level directory, press <U>
let NERDTreeMinimalUI = 1

" Allow to use the mouse click to open file/folder
let NERDTreeMouseMode = 3

" Disable `NERDTree` status line
let NERDTreeStatusline = ' '

" Close `NERDTree` on file open
" let NERDTreeQuitOnOpen = 1

" Show hidden file(s)
let NERDTreeShowHidden = 1

" Hide these file(s) from the tree
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store
set wildignore+=composer.lock,node_modules,package-lock.json
let NERDTreeRespectWildIgnore = 1

" Put `NERDTree` to the left
let NERDTreeWinPos = 'left'
let NERDTreeWinSize = 30

" Dummy variable
autocmd StdInReadPre * let s:std_in = 1
" Automatically open `NERDTree` when Vim starts up
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | else | NERDTree % | wincmd p | endif
" Automatically close `NERDTree` on last file close
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | q | endif

" Buggy :(
let g:strip_whitespace_on_save = 1
let g:strip_whitelines_on_eof = 1
let g:strip_whitespace_confirm = 0
autocmd VimEnter * EnableWhitespace
autocmd VimEnter * EnableStripWhitespaceOnSave

" Deactivate ruler on entering the insert mode
autocmd InsertEnter * setlocal noruler
" Reactivate ruler on leaving the insert mode
autocmd InsertLeave * setlocal ruler

" Clear search marker on entering the insert mode
autocmd InsertEnter * :let b:_search=@/ | let @/=''
" Add previous search marker on leaving the insert mode
autocmd InsertLeave * :let @/=get(b:,'_search','')

" Clear search marker and reload color scheme with <CTRL+L>
nnoremap <silent> <C-L> :nohlsearch <BAR> call ReloadColorScheme()<CR><C-L><ESC>
function! ReloadColorScheme()
  exec 'colorscheme ' . g:skin
endfunction

" Map common task(s) with leader key
" map <silent> <Leader>q :q<CR>
" map <silent> <Leader>w :w<CR>
" map <silent> <Leader>x :x<CR>

" Preserve visual block selection after indent/outdent
vmap > >gv^
vmap < <gv^

" Getting back to normal mode after entering visual mode feels so slow.
" Maybe this is due to a certain plugin. This line solves the problem.
set ttimeout
set ttimeoutlen=50

" Toggle `NERDTree` with <CTRL+N>
map <silent> <C-N> :NERDTreeToggle<CR>

" Navigate between split(s) with <CTRL+LEFT/DOWN/UP/RIGHT>
nnoremap <C-Left> <C-W>h
nnoremap <C-Down> <C-W>j
nnoremap <C-Up> <C-W>k
nnoremap <C-Right> <C-W>l

" Navigate to other split(s) from terminal with <CTRL+LEFT/DOWN/UP/RIGHT>
tnoremap <C-Left> <C-W>h
tnoremap <C-Down> <C-W>j
tnoremap <C-Up> <C-W>k
tnoremap <C-Right> <C-W>l

" Toggle terminal mode with <SHIFT+T>
nnoremap <silent> <S-T> :term++rows=8<CR>
tnoremap <silent> <S-T> <C-W>:q!<CR>

" As alternative, you can also exit terminal mode with <CTRL+D>
tnoremap <silent> <C-D> <C-W>:q!<CR>
