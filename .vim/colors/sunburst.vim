" Modified from <https://github.com/sickill/vim-sunburst>
" Current Vim version: 9.0

set background=dark
hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'sunburst'

hi Normal ctermfg=231 ctermbg=233 cterm=NONE guifg=#ffffff guibg=#121212 gui=NONE
hi Visual ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#303030 gui=NONE

hi LineNr ctermfg=244 ctermbg=234 cterm=NONE guifg=#808080 guibg=#1c1c1c gui=NONE

hi NonText ctermfg=236 ctermbg=233 cterm=NONE guifg=#303030 guibg=#121212 gui=NONE
hi SpecialKey ctermfg=236 ctermbg=233 cterm=NONE guifg=#303030 guibg=#121212 gui=NONE

hi CursorColumn ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#1c1c1c gui=NONE
hi CursorLine ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#1c1c1c gui=NONE

hi ColorColumn ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#1c1c1c gui=NONE

hi DiffAdd ctermfg=233 ctermbg=2 cterm=NONE guifg=#121212 guibg=#008000 gui=NONE
hi DiffChange ctermfg=244 ctermbg=236 cterm=NONE guifg=#808080 guibg=#303030 gui=NONE
hi DiffDelete ctermfg=233 ctermbg=1 cterm=NONE guifg=#121212 guibg=#800000 gui=NONE
hi DiffText ctermfg=233 ctermbg=4 cterm=NONE guifg=#121212 guibg=#000080 gui=NONE

hi DiffAdded ctermfg=233 ctermbg=2 cterm=NONE guifg=#121212 guibg=#008000 gui=NONE
hi DiffRemoved ctermfg=233 ctermbg=1 cterm=NONE guifg=#121212 guibg=#800000 gui=NONE

hi VertSplit ctermfg=236 ctermbg=233 cterm=NONE guifg=#303030 guibg=#121212 gui=NONE

hi StatusLine ctermfg=231 ctermbg=236 cterm=NONE guifg=#ffffff guibg=#303030 gui=NONE
hi StatusLineNC ctermfg=246 ctermbg=236 cterm=NONE guifg=#949494 guibg=#303030 gui=NONE
hi StatusLineTerm ctermfg=233 ctermbg=244 cterm=NONE guifg=#121212 guibg=#808080 gui=NONE
hi StatusLineTermNC ctermfg=233 ctermbg=244 cterm=NONE  guifg=#121212 guibg=#808080 gui=NONE

hi ErrorMsg ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff5f5f guibg=NONE gui=NONE
hi ModeMsg ctermfg=95 ctermbg=NONE cterm=bold guifg=#875f5f guibg=NONE gui=bold
hi WarningMsg ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffd75f guibg=NONE gui=NONE

hi Question ctermfg=150 ctermbg=NONE cterm=NONE guifg=#afd787 guibg=NONE gui=NONE

hi TabLine ctermfg=246 ctermbg=236 cterm=NONE guifg=#949494 guibg=#303030 gui=NONE
hi TabLineFill ctermfg=246 ctermbg=236 cterm=NONE guifg=#949494 guibg=#303030 gui=NONE
hi TabLineSel ctermfg=231 ctermbg=233 cterm=NONE guifg=#ffffff guibg=#121212 gui=NONE

hi Pmenu ctermfg=111 ctermbg=234 cterm=NONE guifg=#87afff guibg=#1c1c1c gui=NONE
hi PmenuSel ctermfg=111 ctermbg=236 cterm=NONE guifg=#87afff guibg=#303030 gui=NONE

hi IncSearch ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline

hi Folded ctermfg=250 ctermbg=0 cterm=NONE guifg=#b2b2b2 guibg=#000000 gui=NONE
hi MatchParen ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#303030 gui=NONE

hi Comment ctermfg=249 ctermbg=NONE cterm=NONE guifg=#b2b2b2 guibg=NONE gui=NONE
hi Constant ctermfg=68 ctermbg=NONE cterm=NONE guifg=#5f87d7 guibg=NONE gui=NONE
hi Directory ctermfg=68 ctermbg=NONE cterm=NONE guifg=#5f87d7 guibg=NONE gui=NONE
hi Error ctermfg=233 ctermbg=203 cterm=NONE guifg=#121212 guibg=#ff5f5f gui=NONE
hi Function ctermfg=111 ctermbg=NONE cterm=NONE guifg=#87afff guibg=NONE gui=NONE
hi Identifier ctermfg=113 ctermbg=NONE cterm=NONE guifg=#87d75f guibg=NONE gui=NONE
hi PreProc ctermfg=173 ctermbg=NONE cterm=NONE guifg=#d7875f guibg=NONE gui=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi SpecialChar ctermfg=103 ctermbg=NONE cterm=NONE guifg=#8787af guibg=NONE gui=NONE
hi Statement ctermfg=173 ctermbg=NONE cterm=NONE guifg=#d7875f guibg=NONE gui=NONE

hi String ctermfg=71 ctermbg=NONE cterm=NONE guifg=#5faf5f guibg=NONE gui=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#ffffff guibg=NONE gui=bold
hi Todo ctermfg=249 ctermbg=NONE cterm=inverse,bold guifg=#b2b2b2 guibg=NONE gui=inverse,bold
hi Type ctermfg=111 ctermbg=NONE cterm=NONE guifg=#87afff guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline

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
hi link Terminal Normal
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

" Mallard
hi link mallardTagName Tag

" Markdown
hi link markdownCode SpecialChar
hi link markdownCodeBlock SpecialChar
hi link markdownHeadingDelimiter Number
hi link markdownHeadingRule Number
hi link markdownH1 Tag
hi link markdownH2 Tag
hi link markdownH3 Tag
hi link markdownH4 Tag
hi link markdownH5 Tag
hi link markdownH6 Tag
hi link markdownListMarker Keyword
hi link markdownOrderedListMarker Number

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

" XML
hi link xmlAttrib Tag
hi link xmlAttribPunct Tag
hi link xmlCdata Comment
hi link xmlCdataCdata Comment
hi link xmlCdataEnd Comment
hi link xmlCdataStart Comment
hi link xmlDocType Tag
hi link xmlDocTypeDecl Tag
hi link xmlDocTypeKeyword Tag
hi link xmlEndTag Tag
hi link xmlEntity SpecialChar
hi link xmlEntityPunct SpecialChar
hi link xmlEqual Tag
hi link xmlProcessing Tag
hi link xmlProcessingDelim Tag
hi link xmlTag Tag

" YAML
hi link yamlKeyValueDelimiter Normal