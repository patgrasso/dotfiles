execute pathogen#infect()

set encoding=utf-8
set fileencoding=utf-8

" Indentation
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

filetype plugin indent on


" Mouse Ability
set mouse=a

" Terminal Colors
try | set guicolors     | catch | endtry
try | set termguicolors | catch | endtry
set t_Co=256
set t_ut=
"let g:solarized_termcolors=256
"let g:molokai_original = 1
colorscheme one


syntax on


" Highlighting for specific extensions
au BufNewFile,BufRead *.hbs set filetype=html
au BufNewFile,BufRead *.ejs set filetype=html
"au BufNewFile,BufRead *.js  set filetype=js
"au BufNewFile,BufRead *.jsx set filetype=jsx
"au BufNewFile,BufRead *.jade set filetype=html


" Other Stuff
set number
set laststatus=2
set nospell
set showcmd
set backspace=indent,eol,start
set ruler
set foldlevelstart=99
set textwidth=79


" Trailing Whitespace
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.


" Search
set hlsearch
set incsearch


" Buffer Movement (Like Tabs)
function! ChangeBuffer()
  " If a count is specified, move to that buffer
  " Otherwise, go to next buffer (:bn)
  if v:count>0
    exe "buffer" v:count
  else
    bnext
  endif
endfunction

map <silent> gb :<C-U>call ChangeBuffer()<CR>
map <silent> gB :bp<CR>

set hidden


"========================== PLUGINS =========================="

" Airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'


" Syntastic
let g:syntastic_javascript_checkers = ['eslint']


" NERDTree Mapping
nnoremap <C-e> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" pangloss/vim-javascript
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

let g:javascript_plugin_jsdoc = 1
hi link jsDocTags   Constant
hi link jsDocParam  Normal
hi link jsNull      Constant
hi link jsUndefined Constant
hi link jsFunction  Keyword


" YouCompleteMe + TernJS (XXX: this is slow)
"call tern#Enable()
let g:tern_map_keys=1
let g:tern_show_signature_in_pum=1
let g:tern_show_argument_hints='on_move'
let g:ycm_add_preview_to_completeopt=1
autocmd CompleteDone * pclose
autocmd FileType javascript setlocal omnifunc=tern#Complete


" Fugitive
set diffopt+=vertical


" ftplugin
filetype plugin indent on
autocmd Filetype javascript setlocal expandtab ts=2 sw=2 sts=2 tw=79 fo+=t
autocmd Filetype coffee setlocal expandtab ts=2 sw=2 sts=2
autocmd Filetype python setlocal expandtab ts=2 sw=2 sts=2 tw=79 fo+=t
autocmd Filetype jade setlocal expandtab ts=2 sw=2 sts=2
autocmd Filetype ruby setlocal expandtab ts=2 sw=2 sts=2
autocmd Filetype c setlocal expandtab ts=2 sw=2 sts=2


" vim-jsx
let g:jsx_ext_required = 0


" wildmenu
if has('wildmenu')
  set wildmenu
  set wildmode=longest:full,full
  set wildignore+=*.a,*.o,*.pyc,*.class
  set wildignore+=~,*.sw*,*.tmp,*.bak
  set wildignore+=.git,tags
  set wildignore+=*/node_modules/*
  set wildignore+=*.jpg,*.png,*.pdf
endif


"
"" normal mode frames
"nnoremap <silent> <A-Up> :wincmd k<CR>
"nnoremap <silent> <A-Down> :wincmd j<CR>
"nnoremap <silent> <A-Left> :wincmd h<CR>
"nnoremap <silent> <A-Right> :wincmd l<CR>
"
"" insert mode frames
"inoremap <silent> <A-Up> <ESC> :wincmd k<CR>i
"inoremap <silent> <A-Down> <ESC> :wincmd j<CR>i
"inoremap <silent> <A-Left> <ESC> :wincmd h<CR>i
"inoremap <silent> <A-Right> <ESC> :wincmd l<CR>i
"
"" normal mode tabs
"nnoremap <C-T> :tabnew<CR>:e
"nnoremap <C-Q> :tabclose<CR> " close tab
"nnoremap <C-N> :tabn<CR> " next tab
"nnoremap <C-P> :tabp<CR> " previous tab
"
"" insert mode tabs
"inoremap <C-T> <ESC> :tabnew<CR>:e
"imap <C-N> <ESC> :tabn<CR>i
"imap <C-P> <ESC> :tabp<CR>i
"

" SYNTAX STATUSLINE
function! SyntaxItem()
  let line=synIDattr(synID(line("."),col("."),1),"name")
  return line . " " . foldlevel(line("."))
endfunction

"set statusline+=%{SyntaxItem()}
