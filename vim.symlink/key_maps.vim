"
" Key Mappings
"

"
" Map j/k combos to get out of insert mode and turn off search highlighting
inoremap jk <ESC>:noh<CR>
inoremap kj <ESC>:noh<CR>
inoremap jj <ESC>:noh<CR>
inoremap kk <ESC>:noh<CR>

" F2 inserts the date and time at the cursor.
"
inoremap <F2>   <C-R>=strftime("%c")<CR>
nmap     <F2>   a<F2><Esc>

" Tab/Shift+Tab indent/unindent the highlighted block (and maintain the
" highlight after changing the indentation). Works for both Visual and Select
" modes.
"
vmap >  >gv
vmap <  <gv

" Draw lines of dashes or equal signs below us based on the length of the current line 
"
"   yy      Yank whole line
"   p       Put line below current line
"   ^       Move to beginning of line
"   v$      Visually highlight to end of line
"   r-      Replace highlighted portion with dashes / equal signs
"   j       Move down one line
"   a       Return to Insert mode
"
" XXX: Convert this to a function and make the symbol a parameter.
" XXX: Consider making abbreviations/mappings for ---<CR> and ===<CR>
"
inoremap <C-U>- <Esc>yyp^v$r-ja
inoremap <C-U>= <Esc>yyp^v$r=ja

" Center the display line after searches. (This makes it *much* easier to see
" the matched line.)
"
" More info: http://www.vim.org/tips/tip.php?tip_id=528
"
nnoremap n   nzz
nnoremap N   Nzz
nnoremap *   *zz
nnoremap #   #zz
nnoremap g*  g*zz
nnoremap g#  g#zz
"
" Make page-forward and page-backward work in insert mode.
"
inoremap <C-F>  <C-O><C-F>
inoremap <C-B>  <C-O><C-B>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

" Turn On/Off NERDTree
map <leader>n :NERDTreeToggle<CR>

" CtrlP maps
map <leader>t :CtrlP<CR>
map <leader>p :CtrlPMixed<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>m :CtrlPMRU<CR>

" Get rid of the distracting search highlighting easily
nnoremap <leader><space> :noh<cr>

" Use tab to move between matching pairs. Much easier to hit than %
nmap <tab> %
vmap <tab> %

" Move up and down by screen lines with the arrow keys
nnoremap <Up> gk
nnoremap <Down> gj

" I hit <F1> more often when trying to hit ESC than when I want :help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Strip all the trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Make it easier to invoke ack for searching
nnoremap <leader>a :Ack<SPACE>

" Reselect last pasted text. Makes it easy to adjust indention, etc
nnoremap <leader>v V`]

" Make dot operator work in visual mode
xnoremap . :normal .<CR>
