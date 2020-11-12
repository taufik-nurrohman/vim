" Modified from <https://github.com/sickill/vim-sunburst>
" Terminal only. All GUI color definition has been removed.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "sunburst"

hi Normal ctermfg=231 ctermbg=233 cterm=NONE
hi Visual ctermfg=NONE ctermbg=236 cterm=NONE

hi LineNr ctermfg=244 ctermbg=234 cterm=NONE
hi NonText ctermfg=236 ctermbg=233 cterm=NONE

hi CursorColumn ctermfg=NONE ctermbg=234 cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=234 cterm=NONE

hi ColorColumn ctermfg=NONE ctermbg=234 cterm=NONE

hi VertSplit ctermfg=236 ctermbg=233 cterm=NONE

hi StatusLine ctermfg=231 ctermbg=236 cterm=NONE
hi StatusLineNC ctermfg=246 ctermbg=236 cterm=NONE

"hi ErrorMsg
hi ModeMsg ctermfg=1 ctermbg=NONE cterm=bold
"hi Question
"hi WarningMsg

hi link MoreMsg ModeMsg

hi TabLine ctermfg=246 ctermbg=236 cterm=NONE
hi TabLineFill ctermfg=246 ctermbg=236 cterm=NONE
hi TabLineSel ctermfg=231 ctermbg=233 cterm=NONE

hi Pmenu ctermfg=111 ctermbg=234 cterm=NONE
hi PmenuSel ctermfg=111 ctermbg=236 cterm=NONE

hi IncSearch ctermfg=234 ctermbg=220 cterm=NONE
hi Search ctermfg=234 ctermbg=220 cterm=NONE

hi Directory ctermfg=68 ctermbg=NONE cterm=NONE
hi link NERDTreeDirSlash Directory
hi link NERDTreeDirSlash Directory

hi Folded ctermfg=249 ctermbg=0 cterm=NONE
hi MatchParen ctermfg=NONE ctermbg=NONE cterm=underline

hi Boolean ctermfg=68 ctermbg=NONE cterm=NONE
hi Character ctermfg=68 ctermbg=NONE cterm=NONE
hi Comment ctermfg=249 ctermbg=NONE cterm=NONE
hi Conditional ctermfg=173 ctermbg=NONE cterm=NONE
hi Constant ctermfg=68 ctermbg=NONE cterm=NONE
hi Define ctermfg=173 ctermbg=NONE cterm=NONE

hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE

hi Float ctermfg=68 ctermbg=NONE cterm=NONE
hi Function ctermfg=111 ctermbg=NONE cterm=NONE
hi Identifier ctermfg=113 ctermbg=NONE cterm=NONE
hi Keyword ctermfg=173 ctermbg=NONE cterm=NONE
hi Label ctermfg=71 ctermbg=NONE cterm=NONE
hi Number ctermfg=68 ctermbg=NONE cterm=NONE
hi Operator ctermfg=173 ctermbg=NONE cterm=NONE
hi PreProc ctermfg=173 ctermbg=NONE cterm=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE
hi SpecialKey ctermfg=23 ctermbg=234 cterm=NONE
hi Statement ctermfg=173 ctermbg=NONE cterm=NONE
hi StorageClass ctermfg=113 ctermbg=NONE cterm=NONE
hi String ctermfg=71 ctermbg=NONE cterm=NONE
hi Tag ctermfg=111 ctermbg=NONE cterm=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold
hi Todo ctermfg=249 ctermbg=NONE cterm=inverse,bold
hi Type ctermfg=111 ctermbg=NONE cterm=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline

hi link htmlTag Tag
hi link htmlEndTag Tag
hi link htmlTagName Tag
hi link htmlSpecialTagName Tag
hi link htmlArg Tag
"hi link htmlEvent Tag
hi htmlSpecialChar ctermfg=68 ctermbg=NONE cterm=NONE

hi link javaScriptFunction Identifier
hi link javaScriptBraces Normal

hi yamlKey ctermfg=111 ctermbg=NONE cterm=NONE
hi yamlAnchor ctermfg=68 ctermbg=NONE cterm=NONE
hi yamlAlias ctermfg=68 ctermbg=NONE cterm=NONE
hi yamlDocumentHeader ctermfg=71 ctermbg=NONE cterm=NONE

hi cssURL ctermfg=68 ctermbg=NONE cterm=NONE
hi cssFunctionName ctermfg=186 ctermbg=NONE cterm=NONE
hi cssColor ctermfg=68 ctermbg=NONE cterm=NONE
hi cssPseudoClassId ctermfg=111 ctermbg=NONE cterm=NONE
hi cssClassName ctermfg=111 ctermbg=NONE cterm=NONE
hi cssValueLength ctermfg=68 ctermbg=NONE cterm=NONE
hi cssCommonAttr ctermfg=167 ctermbg=NONE cterm=NONE
hi link cssBraces Normal

hi link phpIntVar Identifier
hi link phpMemberSelector Normal
hi link phpStorageClass Statement
hi link phpType Statement
hi link phpVarSelector phpIntVar
