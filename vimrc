" Maintained by Taufik Nurrohman
" <https://taufik-nurrohman.com>


set title
set nocompatible

set backspace=eol,indent,start

set titlestring=%t

if has('gui_running')
  set clipboard=unnamed
  if (has('win16') || has('win32') || has('win64'))
    autocmd GUIEnter * simalt ~x
  endif
  set guioptions-=L " Remove left scroll bar
  set guioptions-=R " Remove right scroll bar
  set guioptions-=T " Remove tool bar
  set guioptions-=e " Remove tab bar
  set guioptions-=l " Remove left scroll bar
  set guioptions-=m " Remove menu bar
  set guioptions-=r " Remove right scroll bar
  " " Select all with <CTRL+A>
  " inoremap <C-a> <Esc>gg0vG$
  " nnoremap <C-a> gg0vG$
  " vnoremap <C-a> <Esc>gg0vG$
  " " Copy with <CTRL+C>
  " inoremap <C-c> <Esc>V"+y
  " nnoremap <C-c> V"+y
  " vnoremap <C-c> "+y
  " " Find with <CTRL+F>
  " inoremap <C-f> <Esc>/
  " nnoremap <C-f> /
  " vnoremap <C-f> <Esc>/
  " Save with <CTRL+S>
  inoremap <C-s> <Esc>:w<CR>
  nnoremap <C-s> :w<CR>
  vnoremap <C-s> <Esc>:w<CR>
  " " Paste with <CTRL+V>
  " inoremap <C-v> <C-r><C-o>+
  " vnoremap <C-v> c<Esc>"+p
  " " Cut with <CTRL+X>
  " inoremap <C-x> <Esc>V"+c
  " nnoremap <C-x> V"+c
  " vnoremap <C-x> "+c
  " " Redo with <CTRL+Y>
  " inoremap <C-y> <Esc><C-r>
  " nnoremap <C-y> <C-r>
  " vnoremap <C-y> <Esc><C-r>
  " " Undo with <CTRL+Z>
  " inoremap <C-z> <Esc>ua
  " nnoremap <C-z> u
  " vnoremap <C-z> <Esc>u
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
set hlsearch
set noincsearch

" Ignore case in search string unless I have some upper-case letter(s) there
set ignorecase
set smartcase

" Disable regular expression only in search/replace mode
autocmd CmdWinEnter * set nomagic
autocmd CmdWinLeave * set magic

" Indent with 4 space(s)
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Remove EOL where possible
set binary
set fileformat=unix
set noeol
set nofixeol
autocmd BufWritePre * setlocal fileformat=unix noeol

" Indent with 2 space(s) for specific file type(s)
autocmd FileType css,html,jade,json,pug,scss,sgml,vim,xml,yaml setlocal softtabstop=2 tabstop=2 shiftwidth=2

" Open split(s) to the bottom and/or right
set splitbelow
set splitright

" Automatic indentation
set autoindent
set expandtab
set smartindent
set smarttab

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

let g:NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrows = 1

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
set wildignore+=.git,composer.lock,package-lock.json
let g:NERDTreeRespectWildIgnore = 1

" Put `NERDTree` to the left
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 30

" Automatically delete buffer of the deleted file
let g:NERDTreeAutoDeleteBuffer = 1

" Dummy variable
autocmd StdInReadPre * let s:std_in = 1
" Automatically open `NERDTree` when Vim starts up
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | else | NERDTree % | wincmd p | endif
" Automatically close `NERDTree` on last file close
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | q | endif

" Buggy :(
let g:strip_whitelines_on_eof = 1
let g:strip_whitespace_confirm = 0
let g:strip_whitespace_on_save = 1
autocmd VimEnter * EnableStripWhitespaceOnSave
autocmd VimEnter * EnableWhitespace

" Deactivate ruler on entering the insert mode
autocmd InsertEnter * setlocal noruler
" Reactivate ruler on leaving the insert mode
autocmd InsertLeave * setlocal ruler

" Force to hide line number in terminal even in normal mode
autocmd TerminalOpen * setlocal nonumber norelativenumber

" Clear search marker on entering the insert mode
autocmd InsertEnter * :let b:_search=@/ | let @/=''
" Add previous search marker on leaving the insert mode
autocmd InsertLeave * :let @/=get(b:,'_search','')

" Preserve visual block selection after indent/outdent
vnoremap > >gv^
vnoremap < <gv^

" Redo with <SHIFT+U>
nnoremap U <C-r>

" Select all with <V+V>
vnoremap v <Esc>gg0vG$
vnoremap V <Esc>ggVG

" Put cursor at selection end even if you are selecting from below
vnoremap y ygv<Esc>

" Sort line(s) with <CTRL+DOWN> or <CTRL+UP>
vnoremap <C-Down> :sort<CR><Esc>
vnoremap <C-Up> :sort!<CR><Esc>

" Sort word(s) with <CTRL+LEFT> or <CTRL+RIGHT>
vnoremap <C-Left> d:execute 'normal i' . join(reverse(sort(split(getreg('"'), ' '))), ' ')<CR>
vnoremap <C-Right> d:execute 'normal i' . join(sort(split(getreg('"'), ' ')), ' ')<CR>

" Prevent moving cursor with arrow key(s)
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>

" === Begin <C> Key Maps ===

" Toggle `NERDTree` with <CTRL+B>
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" Focus `NERDTree` with <CTRL+SHIFT+E>
nnoremap <silent> <C-S-e> :NERDTreeFocus<CR>
" Clear search marker and reload color scheme with <CTRL+R>
nnoremap <silent> <C-r> :nohlsearch <bar> call ReloadColorScheme()<CR><Esc>
function! ReloadColorScheme()
  exec 'colorscheme ' . g:skin
endfunction
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
" Quit with <CTRL+D>
nnoremap <silent> <C-d> :q!<CR>
" Move line/selection with <ALT+J/K>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" Move line/selection with <ALT+DOWN/UP>
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

let g:ctrlp_brief_prompt = 1
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_types = ['fil', 'buf']

let g:closetag_filetypes = 'htm,html,xhtml,php,phtml,xml'
let g:closetag_xhtml_filenames = '*.htm,*.html,*.jsx,*.php,*.phtml,*.xhtml,*.xml'

let g:closetag_regions = {
  \ 'javascript.jsx': 'jsxRegion',
  \ 'javascriptreact': 'jsxRegion',
  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
  \ 'typescriptreact': 'jsxRegion,tsxRegion',
  \ }

" === End <C> Key Maps ===


" === Begin <Leader> Key Maps ===

" Set leader key as ` `
nnoremap <Space> <nop>
let g:mapleader = ' '
" New tab with <SPACE+T>
nnoremap <silent> <Leader>t :tabnew<CR>

" === End <Leader> Key Maps ===


" === Begin Plugin Manager ===

call plug#begin('~/.vim/pack/vendor/start')
  Plug 'https://github.com/zef/vim-cycle', { 'as': 'cycle' }
  Plug 'PhilRunninger/nerdtree-visual-selection', { 'as': 'nerdtree-visual-selection' }
  Plug 'alvan/vim-closetag', { 'as': 'closetag' }
  Plug 'baopham/vim-nerdtree-unfocus', { 'as': 'nerdtree-unfocus' }
  Plug 'cohama/lexima.vim', { 'as': 'lexima' }
  Plug 'ctrlpvim/ctrlp.vim', { 'as': 'ctrlp' }
  Plug 'dkarter/bullets.vim', { 'as': 'bullets' }
  Plug 'editorconfig/editorconfig-vim', {'as': 'editorconfig'}
  Plug 'farmergreg/vim-lastplace', { 'as': 'lastplace' }
  Plug 'gcmt/taboo.vim', { 'as': 'taboo' }
  Plug 'maxboisvert/vim-simple-complete', { 'as': 'simple-complete' }
  Plug 'ntpeters/vim-better-whitespace', { 'as': 'better-whitespace' }
  Plug 'preservim/nerdtree', { 'as': 'nerdtree' }
  Plug 'tpope/vim-commentary', { 'as': 'commentary' }
  Plug 'tpope/vim-repeat', { 'as': 'repeat' }
  Plug 'tpope/vim-surround', { 'as': 'surround' }
  Plug 'tpope/vim-unimpaired', { 'as': 'unimpaired' }
call plug#end()

" === End Plugin Manager ===


" Getting back to normal mode after entering visual mode feels so slow.
" Maybe this is due to a certain plugin. These lines solve the problem.
set timeout
set timeoutlen=1000
set ttimeoutlen=100

set colorcolumn=120

" <https://stackoverflow.com/a/16920294/1163000>
set re=1

" <https://vi.stackexchange.com/q/422>
set list listchars=eol:\ ,extends:…,nbsp:●,precedes:…,space:\ ,tab:⇥\ ,trail:·