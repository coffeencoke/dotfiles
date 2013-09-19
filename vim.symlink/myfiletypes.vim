" Associate file extension with type
"
augroup filetype
  autocmd!
  autocmd! BufRead,BufNewFile *.lic    set filetype=ruby
  autocmd! BufRead,BufNewFile *.coffee set filetype=coffee
  autocmd! FileType           markdown setlocal spell spelllang=en_us
augroup END
