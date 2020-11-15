" === plugin functions === {{{

" === focus functions === {{{
"
" s:NERDTreeFocus() {{{
"
" if the current window is NERDTree, move focus to the next window
fun! s:NERDTreeFocus()
  if !s:IsCurrentWindowNERDTree() && exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
    exe bufwinnr(t:NERDTreeBufName) . "wincmd w"
  endif
endfun

" }}}
" s:NERDTreeUnfocus() {{{
"
" if the current window is NERDTree, move focus to the next window
fun! s:NERDTreeUnfocus()
  " save current window so that it's focus can be restored after switching
  " back to this tab
  let t:NERDTreeTabLastWindow = winnr()
  if s:IsCurrentWindowNERDTree()
    let l:winNum = s:NextNormalWindow()
    if l:winNum != -1
      exec l:winNum.'wincmd w'
    else
      wincmd w
    endif
  endif
endfun

" }}}
" s:NERDTreeRestoreFocus() {{{
"
" restore focus to the window that was focused before leaving current tab
fun! s:NERDTreeRestoreFocus()
  if exists("t:NERDTreeTabLastWindow")
    exe t:NERDTreeTabLastWindow . "wincmd w"
  endif
endfun

" }}}
" s:SaveGlobalFocus() {{{
"
fun! s:SaveGlobalFocus()
  let s:is_nerdtree_globally_focused = s:IsCurrentWindowNERDTree()
endfun

" }}}
" s:IfFocusOnStartup() {{{
"
fun! s:IfFocusOnStartup()
  return strlen(bufname('$')) == 0 || !getbufvar('$', '&modifiable')
endfun

" }}}
"
" === focus functions === }}}
" === utility functions === {{{
"
" s:NextNormalWindow() {{{
"
" find next window with a normal buffer
fun! s:NextNormalWindow()
  let l:i = 1
  while(l:i <= winnr('$'))
    let l:buf = winbufnr(l:i)

    " skip unlisted buffers
    if buflisted(l:buf) == 0
      let l:i = l:i + 1
      continue
    endif

    " skip un-modifiable buffers
    if getbufvar(l:buf, '&modifiable') != 1
      let l:i = l:i + 1
      continue
    endif

    " skip temporary buffers with buftype set
    if empty(getbufvar(l:buf, "&buftype")) != 1
      let l:i = l:i + 1
      continue
    endif

    return l:i
  endwhile
  return -1
endfun

" }}}

" s:IsCurrentWindowNERDTree() {{{
"
" returns 1 if current window is NERDTree, false otherwise
fun! s:IsCurrentWindowNERDTree()
  return exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr()
endfun

" }}}
" s:IsNERDTreeOpenInCurrentTab() {{{
"
" check if NERDTree is open in current tab
fun! s:IsNERDTreeOpenInCurrentTab()
  return exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
endfun

" }}}
" s:IsNERDTreePresentInCurrentTab() {{{
"
" check if NERDTree is present in current tab (not necessarily visible)
fun! s:IsNERDTreePresentInCurrentTab()
  return exists("t:NERDTreeBufName")
endfun

" }}}
"
" === utility functions === }}}
" === NERDTree view manipulation (scroll and cursor positions) === {{{
"
" s:SaveNERDTreeViewIfPossible() {{{
"
fun! s:SaveNERDTreeViewIfPossible()
  if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr()
    " save scroll and cursor etc.
    let s:nerdtree_view = winsaveview()

    " save NERDTree window width
    let s:nerdtree_width = winwidth(winnr())

    " save buffer name (to be able to correct desync by commands spawning
    " a new NERDTree instance)
    let s:nerdtree_buffer = bufname("%")
  endif
endfun

" }}}
" s:RestoreNERDTreeViewIfPossible() {{{
"
fun! s:RestoreNERDTreeViewIfPossible()
  " if nerdtree exists in current tab, it is the current window and if saved
  " state is available, restore it
  let l:view_state_saved = exists('s:nerdtree_view') && exists('s:nerdtree_width')
  if s:IsNERDTreeOpenInCurrentTab() && l:view_state_saved
    let l:current_winnr = winnr()
    let l:nerdtree_winnr = bufwinnr(t:NERDTreeBufName)

    " switch to NERDTree window
    exe l:nerdtree_winnr . "wincmd w"
    " load the correct NERDTree buffer if not already loaded
    if exists('s:nerdtree_buffer') && t:NERDTreeBufName != s:nerdtree_buffer
      silent NERDTreeClose
      silent NERDTreeMirror
    endif
    " restore cursor, scroll and window width
    call winrestview(s:nerdtree_view)
    exe "vertical resize " . s:nerdtree_width

    " switch back to whatever window was focused before
    exe l:current_winnr . "wincmd w"
  endif
endfun

" }}}
"
" === NERDTree view manipulation (scroll and cursor positions) === }}}
"
" === plugin functions ===  }}}
" === plugin event handlers === {{{
"
" s:LoadPlugin() {{{
"
fun! s:LoadPlugin()
  if exists('g:nerdtree_unfocus_loaded')
    return
  endif

  let s:disable_handlers_for_tabdo = 0

  " global on/off NERDTree state
  " the exists check is to enable script reloading without resetting the state
  if !exists('s:nerdtree_globally_active')
    let s:nerdtree_globally_active = 0
  endif

  " global focused/unfocused NERDTree state
  " the exists check is to enable script reloading without resetting the state
  if !exists('s:is_nerdtree_globally_focused')
    call s:SaveGlobalFocus()
  end

  augroup NERDTreeTabs
    autocmd!
    autocmd TabEnter * call <SID>TabEnterHandler()
    autocmd TabLeave * call <SID>TabLeaveHandler()
    autocmd WinLeave * call <SID>WinLeaveHandler()
  augroup END

  let g:nerdtree_unfocus_loaded = 1
endfun

" }}}

" s:TabEnterHandler() {{{
"
fun! s:TabEnterHandler()
  if s:disable_handlers_for_tabdo
    return
  endif

  call s:NERDTreeRestoreFocus()
endfun

" }}}
" s:TabLeaveHandler() {{{
"
fun! s:TabLeaveHandler()
  call s:SaveGlobalFocus()
  call s:NERDTreeUnfocus()
endfun

" }}}

" s:WinLeaveHandler() {{{
"
fun! s:WinLeaveHandler()
  if s:disable_handlers_for_tabdo
    return
  endif

  call s:SaveNERDTreeViewIfPossible()
endfun

" }}}
"
" === plugin event handlers === }}}

call s:LoadPlugin()
