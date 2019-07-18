scriptencoding utf8 " Deal with unicode characters even if system locale is incorrect

" Turn off any vi compatibility
set nocompatible
set shortmess+=I        " Don't show the Vim welcome screen

"Enable syntax highlightning and some nice filetype associations
filetype plugin indent on
syntax enable
colorscheme solarized
"let g:solarized_termcolors=256

" Set $TERM_COLOR to DARK for dark theme, and LIGHT for light theme
if $TERM_COLOR == "DARK"
  set background=dark
  set bg=dark
  hi Normal guibg=black guifg=white
endif
if $TERM_COLOR == "LIGHT"
  hi Normal guibg=white guifg=black
  set background=light
  set bg=light
endif

" Make pasting work much better
nmap <silent> <S-Insert> :set paste<CR>"+p:set nopaste<CR>

set modelines=1         " Enables modelines
set autoindent          " Copy indent from current line for new line
set nosmartindent       " 'smartindent' breaks right-shifting of # lines
set history=10000       " Remember this many commands
set number              " Display line numbers
set numberwidth=4       " Minimum number of columns to show for line numbers
set ruler               " Always show the cursor position
set showmode            " Always show the mode
set showcmd             " Display incomplete commands
set incsearch           " Do incremental searching (as you type)
set hlsearch            " Highlight the latest search pattern
set laststatus=2        " Always show a status line
set splitright          " Split new vertical windows right of current window
set winminheight=0      " Allow windows to shrink to status line.
set winminwidth=0       " Allow windows to shrink to vertical separator.
set lbr                 " Wrap line on word boundaries
set wrap
set expandtab           " Insert spaces for <Tab> press; use spaces to indent.
set smarttab            " Tab respects 'shiftwidth', 'tabstop', 'softtabstop'.
set tabstop=2           " Set the visible width of tabs.
set softtabstop=2       " Edit as if tabs are 2 characters wide.
set shiftwidth=2        " Number of spaces to use for indent and unindent.
set shiftround          " Round indent to a multiple of 'shiftwidth'.
set showcmd             " Letting me know I'm in 'leader' mode
set wildmode=list:longest,full
set wildmenu
autocmd BufWritePre * :%s/\s\+$//e     " auto remove trailing whitespace
set virtualedit=block
set autoindent            " always set autoindenting on
set backspace=2           " allow backspacing over everything in insert mode
set cindent               " c code indenting
set diffopt=filler,iwhite " keep files synced and ignore whitespace
set foldcolumn=2          " set a column incase we need it
set foldlevel=0           " show contents of all folds
set foldmethod=indent     " use indent unless overridden
set guioptions-=m         " Remove menu from the gui
set guioptions-=T         " Remove toolbar
set hidden                " hide buffers instead of closing
set history=50            " keep 50 lines of command line history
set ignorecase            " Do case insensitive matching
set incsearch             " Incremental search
set laststatus=2          " always have status bar
set linebreak             " This displays long lines as wrapped at word boundries
set matchtime=10          " Time to flash the brack with showmatch
set nobackup              " Don't keep a backup file
set nocompatible          " Use Vim defaults (much better!)
set nofen                 " disable folds
set notimeout             " i like to be pokey
set ttimeout              " timeout on key-codes
set ttimeoutlen=100       " timeout on key-codes after 100ms
set ruler                 " the ruler on the bottom is useful
set scrolloff=1           " dont let the curser get too close to the edge
set showcmd               " Show (partial) command in status line.
set showmatch             " Show matching brackets.
set textwidth=0           " Don't wrap words by default
set textwidth=80          " This wraps a line with a break when you reach 80 chars
set virtualedit=block     " let blocks be in virtual edit mode
set wildmenu              " This is used with wildmode(full) to cycle options
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-   " useful for cscope in quickfix
set listchars=tab:>-,trail:-                 " prefix tabs with a > and trails with -
set tags+=./.tags;/,./tags;/                 " set ctags
set whichwrap+=<,>,[,],h,l,~                 " arrow keys can wrap in normal and insert modes
set wildmode=list:longest,full               " list all options, match to the longest
set viminfo='20,\"50 " read/write a .viminfo file, don't store more than 50 lines of registers

set helpfile=$VIMRUNTIME/doc/help.txt
set guifont=Courier\ 10\ Pitch\ 10
set path+=.,..,../..,../../..,../../../..,/usr/include

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files I am not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.class

" " Care about case only if I use an uppercase letter
set ignorecase
set smartcase

" Set visual bell to nothing
set vb
set t_vb=

" Make buffers less annoying, i.e.,
" keep changed buffers without requiring saves
set hidden

" Act more 'normal' about backspacing
" e.g. to backspace past start of edit
set backspace=indent,eol,start

set whichwrap+=<,>,[,]

set listchars=tab:>-,trail:·
set list

" Update the swap file every 20 characters. I don't like to lose stuff.
"
set updatecount=20

" Macvim settings
if has("gui_macvim")
  " Update for using mac fn, control, alt/option, and command keys
  let macvim_hig_shift_movement = 1
  " Remove enormous tab bar at top of macvim
  set guioptions=egmrt
endif

" CTRLP Mappings
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
if has("gui_macvim")
  let g:ctrlp_map = '<D-t>'
else
  let g:ctrlp_map = '<c-t>'
endif
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 0
" Ignore these directories
set wildignore+=*/out/**
set wildignore+=*/vendor/**
set wildignore+=*/log/**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

if findfile("~/bin/ack") == $HOME."/bin/ack"
  let g:ackprg="~/bin/ack -H --nocolor --nogroup --column"
endif

" Git commit config
autocmd Filetype gitcommit setlocal spell textwidth=72

"Turn on filetype plugins to automagically
  "Grab commands for particular filetypes.
  "Grabbed from $VIM/ftplugin
  filetype plugin on
  filetype indent on

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 et ai
autocmd Filetype jsx setlocal ts=4 sts=4 sw=4

" Auto paste magic for Mac
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Add syntastic checkers
let g:syntastic_javascript_checkers = [ 'jshint' ]
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_shell_checkers = ['shellcheck']

" Enable YouCompleteMe for Typescript
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
