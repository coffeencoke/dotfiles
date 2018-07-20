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
"map <leader>t :CtrlP<CR>
map <C-p> :CtrlP<CR>
" map <leader>p :CtrlPMixed<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>m :CtrlPMRU<CR>

" Make it easier to invoke ack for searching
nnoremap <leader>a :Ack!<space>

" Reselect last pasted text. Makes it easy to adjust indention, etc
nnoremap <leader>v V`]

" Make dot operator work in visual mode
xnoremap . :normal .<CR>

" Zoomwin configuration
map <Leader><Leader> :ZoomWin<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Folding
nnoremap <Space> za " Space to toggle folds.
vnoremap <Space> za " Space to toggle folds.
nnoremap ,z zMzvzz " "Refocus" folds
" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

"maps to close, and open list window
map <silent> <Leader>tc :TlistClose<CR>
map <silent> <Leader>to :TlistOpen<CR>

"Map \e to edit a file from the directory of the current buffer
nmap <Leader>e :e <C-R>=expand("%:p:h") . "/"<CR>
