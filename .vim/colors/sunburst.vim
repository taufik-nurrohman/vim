" Modified from <https://github.com/sickill/vim-sunburst>
" Terminal only. All GUI color definition has been removed.
" Current Vim version: 8.0

set background=dark
hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'sunburst'

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
hi StatusLineTerm ctermfg=233 ctermbg=244 cterm=NONE
hi StatusLineTermNC ctermfg=233 ctermbg=244 cterm=NONE

hi ErrorMsg ctermfg=203 ctermbg=NONE
hi ModeMsg ctermfg=95 ctermbg=NONE cterm=bold
hi WarningMsg ctermfg=221 ctermbg=NONE

hi Question ctermfg=150 ctermbg=NONE

hi TabLine ctermfg=246 ctermbg=236 cterm=NONE
hi TabLineFill ctermfg=246 ctermbg=236 cterm=NONE
hi TabLineSel ctermfg=231 ctermbg=233 cterm=NONE

hi Pmenu ctermfg=111 ctermbg=234 cterm=NONE
hi PmenuSel ctermfg=111 ctermbg=236 cterm=NONE

hi IncSearch ctermfg=234 ctermbg=228 cterm=NONE
hi Search ctermfg=234 ctermbg=228 cterm=NONE

hi Folded ctermfg=249 ctermbg=0 cterm=NONE
hi MatchParen ctermfg=NONE ctermbg=236 cterm=NONE

hi Comment ctermfg=249 ctermbg=NONE cterm=NONE
hi Constant ctermfg=68 ctermbg=NONE cterm=NONE
hi Directory ctermfg=68 ctermbg=NONE cterm=NONE
hi Error ctermfg=233 ctermbg=203 cterm=NONE
hi Function ctermfg=111 ctermbg=NONE cterm=NONE
hi Identifier ctermfg=113 ctermbg=NONE cterm=NONE
hi PreProc ctermfg=173 ctermbg=NONE cterm=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE
hi SpecialChar ctermfg=103 ctermbg=NONE cterm=NONE
hi Statement ctermfg=173 ctermbg=NONE cterm=NONE

hi String ctermfg=71 ctermbg=NONE cterm=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold
hi Todo ctermfg=249 ctermbg=NONE cterm=inverse,bold
hi Type ctermfg=111 ctermbg=NONE cterm=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline

" *
hi link Define Statement
hi link ExtraWhitespace Error
hi link MoreMsg ModeMsg
hi link NERDTreeDir Directory
hi link NERDTreeDirSlash Directory
hi link Operator Normal
hi link StorageClass Statement
hi link Structure Statement
hi link Tag Type
hi link Typedef Statement

" CSS
hi link cssAttrComma Normal
hi link cssBraces Normal
hi link cssCustomProp Identifier
hi link cssFunction Normal
hi link cssFunctionName Function
hi link cssPagePseudo Normal
hi link cssPseudoClass Special
hi link cssPseudoClassFn Special
hi link cssPseudoClassId Special
hi link cssSelectorOp Normal
hi link cssSelectorOp2 Normal
hi link cssTagName Normal

" HTML
hi link htmlArg Tag
hi link htmlEndTag Tag
hi link htmlSpecialChar SpecialChar
hi link htmlSpecialTagName Tag
hi link htmlTag Tag
hi link htmlTagName Tag

" JS
hi link javaScriptBraces Normal
hi link javaScriptExpression Normal
hi link javaScriptFunction Statement
hi link javaScriptGlobal Identifier
hi link javaScriptIdentifier Statement
hi link javaScriptMember Identifier
hi link javaScriptNumber Number
hi link javaScriptOperator Statement
hi link javaScriptSpecial Normal

" JADE, PUG
hi link pugAttributesDelimiter Normal
hi link pugTag htmlTag

" JSON
hi link jsonBraces Normal

" PHP
hi link phpClass Function
hi link phpClassDelimiter Normal
hi link phpClassExtends Function
hi link phpClassImplements Function
hi link phpIntVar Identifier
hi link phpMemberSelector Normal
hi link phpNullValue phpBoolean
hi link phpFunction Function
hi link phpParent Normal
hi link phpSuperglobals Identifier
hi link phpType Statement
hi link phpVarSelector phpIntVar

" YAML
hi link yamlKeyValueDelimiter Normal
