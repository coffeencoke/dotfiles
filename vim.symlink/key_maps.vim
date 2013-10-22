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
map <C-p> :CtrlP<CR>
map <leader>p :CtrlPMixed<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>m :CtrlPMRU<CR>

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


