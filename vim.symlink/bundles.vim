set nocompatible
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Management
Bundle 'gmarik/vundle'

" Cosmetic
Bundle 'flazz/vim-colorschemes'
Bundle 'altercation/vim-colors-solarized'

" Functional
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'taglist.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'cperl82/bufexplorer'
Bundle 'tpope/vim-eunuch'
Bundle 'ZoomWin'
Bundle 'tpope/vim-commentary'
Bundle 'Align'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'zephod/vim-iterm2-navigator'
Bundle 'scrooloose/syntastic'
Bundle 'dbeniamine/cheat.sh-vim'
Bundle 'powerline/powerline'

" Snippets
"Bundle 'SirVer/ultisnips'
"Bundle 'honza/vim-snippets'

" Language Specific
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'isRuslan/vim-es6'
Bundle 'jgdavey/vim-blockle'
Bundle 'aming/vim-mason'
Bundle 'mxw/vim-jsx'
Bundle 'tpope/vim-haml'

" Git
Bundle 'tpope/vim-fugitive'

" Consider pulling in
" Bundle 'tpope/vim-bundler'
" Bundle 'tsaleh/vim-align'
"Bundle "bling/vim-airline"
"let g:airline_left_sep=''
"let g:airline_right_sep=''

filetype plugin indent on " required!

