" Set 'selection', 'selectmode', 'mousemodel' and 'keymodel' to make
" both keyboard- and mouse-based highlighting behave more like Windows
" and OS X. (These are the same settings you get with `:behave mswin`.)
"
" Note: 'selectmode', 'keymodel', and 'selection' are also set within
" map_movement_keys.vim, since they're critical to the behavior of those
" mappings (although they should be set to the same values there as here.)
"
" Note: Under MacVim, `:let macvim_hig_shift_movement = 1` will cause MacVim
" to set selectmode and keymodel. See `:help macvim-shift-movement` for
" details.
"
set selectmode=mouse,key
set keymodel=startsel,stopsel
set selection=exclusive
set mousemodel=popup

" These settings are taken from the $VIMRUNTIME/mswin.vim file, which is
" normally used to make Vim behave more like a native MS-Windows
" application. I don't source that file any longer, but I still want
" some of the mappings when running in Windows. (Mappings that I always
" want, regardless of platform, are below this conditional.)
"

" Prepend OS-appropriate temporary directories to the backupdir list.
"
if has("unix") " (including OS X)

    " Remove the current directory from the backup directory list.
    "
    set backupdir-=.

    " Save backup files in the current user's ~/tmp directory, or in the
    " system /tmp directory if that's not possible.
    "
    set backupdir^=~/tmp,/tmp

    " Try to put swap files in ~/tmp (using the munged full pathname of
    " the file to ensure uniqueness). Use the same directory as the
    " current file if ~/tmp isn't available.
    "
    set directory=~/tmp/,/var/tmp/.
endif

