set nocompatible
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Management
Bundle 'gmarik/vundle'

" Cosmetic
Bundle 'flazz/vim-colorschemes'
Bundle "bling/vim-airline"
let g:airline_left_sep=''
let g:airline_right_sep=''

" Functional
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'taglist.vim'
Bundle 'cperl82/bufexplorer'
Bundle 'tpope/vim-eunuch'
Bundle 'ZoomWin'

" Language Specific
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'jgdavey/vim-blockle'

" Git
Bundle 'tpope/vim-fugitive'

" Consider pulling in
" Bundle 'tpope/vim-bundler'
" Bundle 'tsaleh/vim-align'
" Bundle 'tsaleh/vim-matchit'

filetype plugin indent on " required!

