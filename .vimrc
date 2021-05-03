" Maintained by Taufik Nurrohman
" <https://taufik-nurrohman.com>

set title
set nocompatible

set titlestring=%F

if has('gui_running')
  set clipboard=unnamed
  " autocmd GUIEnter * simalt ~x
  set guioptions-=m " remove menu bar
  set guioptions-=T " rmove tool bar
  set guioptions-=r " remove right-hand scroll bar
  set guioptions-=L " remove left-hand scroll bar
  " Copy with <CTRL+C>
  imap <C-c> <Esc>yyi
  nmap <C-c> yy
  vmap <C-c> "+yi
  " Cut with <CTRL+X>
  imap <C-x> <Esc>ddi
  nmap <C-x> dd
  vmap <C-x> "+c
  " Find with <CTRL+F>
  imap <C-f> <Esc>/
  nmap <C-f> /
  vmap <C-f> <Esc>/
  " Paste with <CTRL+V>
  imap <C-v> <C-r><C-o>+
  vmap <C-v> c<Esc>"+p
  " Redo with <CTRL+Y>
  imap <C-y> <Esc><C-r>
  nmap <C-y> <C-r>
  vmap <C-y> <Esc><C-r>
  " Save with <CTRL+S>
  imap <C-s> <Esc>:w<CR>
  nmap <C-s> :w<CR>
  vmap <C-s> <Esc>:w<CR>
  " Undo with <CTRL+Z>
  imap <C-z> <Esc>ua
  nmap <C-z> u
  vmap <C-z> <Esc>u
else
  set t_Co=256
  set t_AB=[48;5;%dm
  set t_AF=[38;5;%dm
  set term=xterm-256color
endif

" Store swap file(s) in a custom directory
set directory^=$HOME/.vim/tmp//

filetype plugin indent on
syntax on

" Set default color scheme
let g:skin = 'sunburst'

" Set default encoding
set encoding=utf-8

" Show line number(s)
set number

" Show file name and cursor position at the bottom bar
set ruler

" Always show the status line
set laststatus=2

" Enable line wrap
set wrap

" Show command(s)
set showcmd

" Do not `hlsearch` until I press <ENTER>
set noincsearch
set hlsearch

" Ignore case in search string unless I have some upper-case letter(s) there
set ignorecase
set smartcase

" Disable regular expression only in search/replace mode
autocmd CmdWinEnter * set nomagic
autocmd CmdWinLeave * set magic

" Indent with 4 space(s)
set softtabstop=4
set tabstop=4
set shiftwidth=4

" Open split(s) to the bottom and/or right
set splitbelow
set splitright

" Indent with 2 space(s) for specific file type(s)
autocmd FileType css,html,jade,json,pug,scss,sgml,xml,yaml setlocal softtabstop=2 tabstop=2 shiftwidth=2

" Automatic indentation
set autoindent
set smartindent
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

set background=dark

exec 'colorscheme ' . g:skin

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" Hide help text and up level description
" To up one level directory, press <U>
let g:NERDTreeMinimalUI = 1

" Use a compact menu that fits on a single line
let g:NERDTreeMinimalMenu = 1

" Allow to use the mouse click to open file/folder
" let g:NERDTreeMouseMode = 3

" Disable `NERDTree` status line
let g:NERDTreeStatusline = ' '

" Close `NERDTree` on file open
" let g:NERDTreeQuitOnOpen = 1

" Show hidden file(s)
let g:NERDTreeShowHidden = 1

" Hide these file(s) from the tree
set wildignore+=*.DS_Store,*.class,*.hg,*.o,*.obj,*.pyc,*.svn,*.swp
set wildignore+=.git,composer.lock,node_modules,package-lock.json
let g:NERDTreeRespectWildIgnore = 1

" Put `NERDTree` to the left
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 30

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

" Preserve visual block selection after indent/outdent
vmap > >gv^
vmap < <gv^

" Select all with <V+V>
vmap v <Esc>gg0vG$
vmap V <Esc>ggVG


" === Begin <C> Key Maps ===

" Toggle `NERDTree` with <CTRL+N>
nmap <silent> <C-n> :NERDTreeToggle<CR>
" Clear search marker and reload color scheme with <CTRL+R>
nnoremap <silent> <C-r> :nohlsearch <bar> call ReloadColorScheme()<CR><Esc>
function! ReloadColorScheme()
  exec 'colorscheme ' . g:skin
endfunction
" Redo with <SHIFT+U>
nnoremap U <C-r>
" Navigate between split(s) with <CTRL+LEFT/DOWN/UP/RIGHT>
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l
" Navigate between split(s) with <CTRL+H/J/K/L>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Navigate to other split(s) from terminal with <CTRL+LEFT/DOWN/UP/RIGHT>
tnoremap <C-Left> <C-w>h
tnoremap <C-Down> <C-w>j
tnoremap <C-Up> <C-w>k
tnoremap <C-Right> <C-w>l
" Navigate to other split(s) from terminal with <CTRL+H/J/K/L>
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l
" Toggle terminal mode with <CTRL+T>
nnoremap <silent> <C-t> :term++rows=10<CR>
tnoremap <silent> <C-t> <C-w>:q!<CR>
" As alternative, you can also exit terminal mode with <CTRL+D>
tnoremap <silent> <C-d> <C-w>:q!<CR>
" Quit with <CTRL-D>
nnoremap <silent> <C-d> :q!<CR>
let g:ctrlp_brief_prompt = 1
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_show_hidden = 1
let g:ctrlp_types = ['fil', 'buf']

" === End <C> Key Maps ===


" === Begin <Leader> Key Maps ===

" Set leader key as ` `
nnoremap <Space> <nop>
let g:mapleader = ' '
" New tab with <SPACE+T>
nmap <silent> <Leader>t :tabnew<CR>
" Edit `.vimrc` file with <SPACE+,>
nmap <silent> <Leader>, :tabedit $MYVIMRC<CR>

" === End <Leader> Key Maps ===


" Getting back to normal mode after entering visual mode feels so slow.
" Maybe this is due to a certain plugin. These lines solve the problem.
set timeout
set ttimeout
set timeoutlen=100
set ttimeoutlen=50
