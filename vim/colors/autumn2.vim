" Vim color file
"  Maintainer: Tiza
" Last Change: 2002/10/14 Mon 16:41.
"     version: 1.0
" This color scheme uses a light background.

set background=light
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "autumn"

hi Normal       ctermfg=238 ctermbg=255 guifg=#404040 guibg=#fff4e8

" Search
hi IncSearch    ctermfg=238 ctermbg=185 gui=UNDERLINE guifg=#404040 guibg=#e0e040
hi Search       ctermfg=239 ctermbg=219 gui=NONE guifg=#544060 guibg=#f0c0ff

" Messages
hi ErrorMsg     ctermfg=231 ctermbg=63 gui=BOLD guifg=#f8f8f8 guibg=#4040ff
hi WarningMsg   ctermfg=231 ctermbg=63 gui=BOLD guifg=#f8f8f8 guibg=#4040ff
hi ModeMsg      ctermfg=166 ctermbg=NONE gui=NONE guifg=#d06000 guibg=NONE
hi MoreMsg      ctermfg=31 ctermbg=NONE gui=NONE guifg=#0090a0 guibg=NONE
hi Question     ctermfg=93 ctermbg=NONE gui=NONE guifg=#8000ff guibg=NONE

" Split area
hi StatusLine   ctermfg=231 ctermbg=95 gui=BOLD guifg=#f8f8f8 guibg=#904838
hi StatusLineNC ctermfg=145 ctermbg=95 gui=BOLD guifg=#c0b0a0 guibg=#904838
hi VertSplit    ctermfg=231 ctermbg=95 gui=NONE guifg=#f8f8f8 guibg=#904838
hi WildMenu     ctermfg=231 ctermbg=203 gui=BOLD guifg=#f8f8f8 guibg=#ff3030

" Diff
hi DiffText     ctermfg=25 ctermbg=153 gui=NONE guifg=#2850a0 guibg=#c0d0f0
hi DiffChange   ctermfg=29 ctermbg=158 gui=NONE guifg=#208040 guibg=#c0f0d0
hi DiffDelete   ctermfg=196 ctermbg=193 gui=NONE guifg=#ff2020 guibg=#eaf2b0
hi DiffAdd      ctermfg=196 ctermbg=193 gui=NONE guifg=#ff2020 guibg=#eaf2b0

" Cursor
hi Cursor       ctermfg=231 ctermbg=33 gui=NONE guifg=#ffffff guibg=#0080f0
hi lCursor      ctermfg=231 ctermbg=99 gui=NONE guifg=#ffffff guibg=#8040ff
hi CursorIM     ctermfg=231 ctermbg=99 gui=NONE guifg=#ffffff guibg=#8040ff

" Fold
hi Folded       ctermfg=95 ctermbg=217 gui=NONE guifg=#804030 guibg=#ffc0a0
hi FoldColumn   ctermfg=131 ctermbg=224 gui=NONE guifg=#a05040 guibg=#f8d8c4

" Other
hi Directory    ctermfg=63 ctermbg=NONE gui=NONE guifg=#7050ff guibg=NONE
hi LineNr       ctermfg=180 ctermbg=NONE gui=NONE guifg=#e0b090 guibg=NONE
hi NonText      ctermfg=131 ctermbg=224 gui=BOLD guifg=#a05040 guibg=#ffe4d4
hi SpecialKey   ctermfg=33 ctermbg=NONE gui=NONE guifg=#0080ff guibg=NONE
hi Title        ctermfg=NONE ctermbg=NONE gui=BOLD guifg=fg      guibg=NONE
hi Visual       ctermfg=94 ctermbg=217 gui=NONE guifg=#804020 guibg=#ffc0a0
" hi VisualNOS  gui=NONE guifg=#604040 guibg=#e8dddd

" Syntax group
hi Comment      ctermfg=203 ctermbg=NONE gui=NONE guifg=#ff5050 guibg=NONE
hi Constant     ctermfg=29 ctermbg=NONE gui=NONE guifg=#00884c guibg=NONE
hi Error        ctermfg=231 ctermbg=63 gui=BOLD guifg=#f8f8f8 guibg=#4040ff
hi Identifier   ctermfg=136 ctermbg=NONE gui=NONE guifg=#b07800 guibg=NONE
hi Ignore       ctermfg=NONE ctermbg=NONE gui=NONE guifg=bg guibg=NONE
hi PreProc      ctermfg=31 ctermbg=NONE gui=NONE guifg=#0090a0 guibg=NONE
hi Special      ctermfg=99 ctermbg=NONE gui=NONE guifg=#8040f0 guibg=NONE
hi Statement    ctermfg=107 ctermbg=NONE gui=BOLD guifg=#80a030 guibg=NONE
hi Todo         ctermfg=33 ctermbg=NONE gui=BOLD,UNDERLINE guifg=#0080f0 guibg=NONE
hi Type         ctermfg=131 ctermbg=NONE gui=BOLD guifg=#b06c58 guibg=NONE
hi Underlined   ctermfg=NONE ctermbg=NONE gui=UNDERLINE guifg=blue guibg=NONE

