" Maintained by Taufik Nurrohman
" <https://taufik-nurrohman.com>

set title
set nocompatible

set titlestring=%F

if has('gui_running')
  autocmd GUIEnter * simalt ~x
  set guioptions-=m " remove menu bar
  set guioptions-=T " rmove tool bar
  set guioptions-=r " remove right-hand scroll bar
  set guioptions-=L " remove left-hand scroll bar
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


" === Begin <ALT> Key Maps ===
" Make sure that your terminal configures Meta key to send escape!

" Toggle `NERDTree` with <ALT+N>
nmap <silent> n :NERDTreeToggle<CR>
" Clear search marker and reload color scheme with <ALT+R>
nnoremap <silent> r :nohlsearch <bar> call ReloadColorScheme()<CR><Esc>
function! ReloadColorScheme()
  exec 'colorscheme ' . g:skin
endfunction
" Navigate between split(s) with <ALT+LEFT/DOWN/UP/RIGHT>
nnoremap [1;3D <C-W>h
nnoremap [1;3B <C-W>j
nnoremap [1;3A <C-W>k
nnoremap [1;3C <C-W>l
" Navigate between split(s) with <ALT+H/J/K/L>
nnoremap h <C-W>h
nnoremap j <C-W>j
nnoremap k <C-W>k
nnoremap l <C-W>l
" Navigate to other split(s) from terminal with <ALT+LEFT/DOWN/UP/RIGHT>
tnoremap [1;3D <C-W>h
tnoremap [1;3B <C-W>j
tnoremap [1;3A <C-W>k
tnoremap [1;3C <C-W>l
" Navigate to other split(s) from terminal with <ALT+H/J/K/L>
tnoremap h <C-W>h
tnoremap j <C-W>j
tnoremap k <C-W>k
tnoremap l <C-W>l
" Toggle terminal mode with <ALT+T>
nnoremap <silent> t :term++rows=10<CR>
tnoremap <silent> t <C-W>:q!<CR>
" As alternative, you can also exit terminal mode with <CTRL+D>
tnoremap <silent> <C-D> <C-W>:q!<CR>
" Save with <ALT-S>
nnoremap <silent> s :w<CR>
" Quit with <ALT-Q>
nnoremap <silent> q :q!<CR>
let g:ctrlp_brief_prompt = 1
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = 'f'
let g:ctrlp_show_hidden = 1
let g:ctrlp_types = ['fil', 'buf']

" === End <ALT> Key Maps ===


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
