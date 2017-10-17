" Vim color file
"
" Author: Anthony Carapetis <anthony.carapetis@gmail.com>
"
" Note: Based on github's syntax highlighting theme
"       Used Brian Mock's darkspectrum as a starting point/template
"       Thanks to Ryan Heath for an easy list of some of the colours:
"       http://rpheath.com/posts/356-github-theme-for-syntax-gem

hi clear

set background=light
set t_Co=256
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="github"

hi Normal       guifg=#000000 guibg=#F8F8FF ctermfg=0 ctermbg=255

" {{{ Cursor
hi Cursor		guibg=#444454 guifg=#F8F8FF ctermbg=238 ctermfg=231
hi CursorLine	guibg=#D8D8DD ctermbg=252
hi CursorColumn	guibg=#E8E8EE ctermbg=252
" }}}

" {{{ Diff
hi DiffAdd         guifg=#003300 guibg=#DDFFDD gui=none ctermfg=22 ctermbg=194 cterm=none
hi DiffChange                    guibg=#ececec gui=none ctermbg=255 cterm=none 
hi DiffText        guifg=#000033 guibg=#DDDDFF gui=none ctermfg=17 ctermbg=252 cterm=none
hi DiffDelete      guifg=#DDCCCC guibg=#FFDDDD gui=none ctermfg=252 ctermbg=224 cterm=none
" }}}

" {{{ Folding / Line Numbering / Status Lines
hi Folded		guibg=#ECECEC guifg=#808080 gui=bold ctermbg=255 ctermfg=244 cterm=bold
hi vimFold		guibg=#ECECEC guifg=#808080 gui=bold ctermbg=255 ctermfg=244 cterm=bold
hi FoldColumn	guibg=#ECECEC guifg=#808080 gui=bold ctermbg=255 ctermfg=244 cterm=bold

hi LineNr		guifg=#959595 guibg=#ECECEC gui=bold ctermfg=246 ctermbg=255 cterm=bold
hi NonText		guifg=#808080 guibg=#ECECEC          ctermfg=244 ctermbg=255 
hi Folded		guifg=#808080 guibg=#ECECEC gui=bold ctermfg=244 ctermbg=255 cterm=bold
hi FoldeColumn  guifg=#808080 guibg=#ECECEC gui=bold ctermfg=244 ctermbg=255 cterm=bold

hi VertSplit	guibg=#bbbbbb guifg=#bbbbbb gui=none ctermbg=250 ctermfg=250 cterm=bold
hi StatusLine   guibg=#bbbbbb guifg=#404040 gui=bold ctermbg=250 ctermfg=238 cterm=bold
hi StatusLineNC guibg=#d4d4d4 guifg=#404040 gui=italic ctermbg=188 ctermfg=238 cterm=italic
" }}}

" {{{ Misc
hi ModeMsg		guifg=#990000 ctermfg=88
hi MoreMsg		guifg=#990000 ctermfg=88

hi Title		guifg=#ef5939 ctermfg=203
hi WarningMsg	guifg=#ef5939 ctermfg=203
hi SpecialKey   guifg=#177F80 gui=italic ctermfg=6 cterm=italic

hi MatchParen	guibg=#cdcdfd guifg=#000000 ctermbg=189 ctermfg=0
hi Underlined	guifg=#000000 gui=underline ctermfg=0 cterm=underline
hi Directory	guifg=#990000 ctermfg=88
" }}}

" {{{ Search, Visual, etc
hi Visual		guifg=#FFFFFF guibg=#3465a4 gui=none ctermfg=15 ctermbg=61 cterm=none
hi VisualNOS    guifg=#FFFFFF guibg=#204a87 gui=none ctermfg=15 ctermbg=24 cterm=none
hi IncSearch	guibg=#cdcdfd guifg=#000000 gui=italic ctermbg=189 ctermfg=0 cterm=italic
hi Search		guibg=#cdcdfd guifg=#000000 gui=italic ctermbg=189 ctermfg=0 cterm=italic
" }}}

" {{{ Syntax groups
hi Ignore		guifg=#808080 ctermfg=244
hi Identifier	guifg=#0086B3 ctermfg=31
hi PreProc		guifg=#A0A0A0 gui=bold ctermfg=247 cterm=bold
hi Comment		guifg=#999988 ctermfg=246
hi Constant		guifg=#177F80 gui=none ctermfg=6 cterm=none
hi String		guifg=#D81745 ctermfg=161
hi Function		guifg=#990000 gui=bold ctermfg=88 cterm=bold
hi Statement	guifg=#000000 gui=bold ctermfg=0 cterm=bold
hi Type			guifg=#445588 gui=bold ctermfg=60 cterm=bold
hi Number		guifg=#1C9898 ctermfg=30
hi Todo			guifg=#FFFFFF guibg=#990000 gui=bold ctermfg=15 ctermbg=88 cterm=bold
hi Special		guifg=#159828 gui=bold ctermfg=28 cterm=bold
hi rubySymbol   guifg=#960B73 ctermfg=90
hi Error        guibg=#f8f8ff guifg=#ff1100 gui=undercurl ctermbg=231 ctermfg=196 cterm=undercurl
hi Todo         guibg=#f8f8ff guifg=#ff1100 gui=underline ctermbg=231 ctermfg=196 cterm=underline
hi Label        guifg=#000000 gui=bold ctermfg=0 cterm=bold
hi StorageClass guifg=#000000 gui=bold ctermfg=0 cterm=bold
hi Structure    guifg=#000000 gui=bold ctermfg=0 cterm=bold
hi TypeDef      guifg=#000000 gui=bold ctermfg=0 cterm=bold
" }}}

" {{{ Completion menus
hi WildMenu     guifg=#7fbdff guibg=#425c78 gui=none ctermfg=111 ctermbg=60 cterm=none
hi Pmenu        guibg=#808080 guifg=#ffffff gui=bold ctermbg=244 ctermfg=15 cterm=bold
hi PmenuSel     guibg=#cdcdfd guifg=#000000 gui=italic ctermbg=189 ctermfg=0 cterm=italic
hi PmenuSbar    guibg=#000000 guifg=#444444 ctermbg=0 ctermfg=238
hi PmenuThumb   guibg=#aaaaaa guifg=#aaaaaa ctermbg=248 ctermfg=248
" }}}

" {{{ Spelling
hi spellBad     guisp=#fcaf3e ctermbg=315
hi spellCap     guisp=#73d216 ctermbg=112
hi spellRare    guisp=#fcaf3e ctermbg=315
hi spellLocal   guisp=#729fcf ctermbg=74
" }}}

" {{{ Aliases
hi link cppSTL          Function
hi link cppSTLType      Type
hi link Character		Number
hi link htmlTag			htmlEndTag
"hi link htmlTagName     htmlTag
hi link htmlLink		Underlined
hi link pythonFunction	Identifier
hi link Question		Type
hi link CursorIM		Cursor
hi link VisualNOS		Visual
hi link xmlTag			Identifier
hi link xmlTagName		Identifier
hi link shDeref			Identifier
hi link shVariable		Function
hi link rubySharpBang	Special
hi link perlSharpBang	Special
hi link schemeFunc      Statement
"hi link shSpecialVariables Constant
"hi link bashSpecialVariables Constant
" }}}

" {{{ Tabs (non-gui0
hi TabLine		guifg=#404040 guibg=#dddddd gui=none ctermfg=238 ctermbg=253 cterm=none
hi TabLineFill	guifg=#404040 guibg=#dddddd gui=none ctermfg=238 ctermbg=253 cterm=none
hi TabLineSel	guifg=#404040 gui=bold ctermfg=238 cterm=bold
" }}}
"
" vim: sw=4 ts=4 foldmethod=marker
