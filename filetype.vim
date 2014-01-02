if exists("did_load_filetypes")
  finish
endif

let g:tex_flavor='latex'

augroup filetypedetect
  au BufNewFile,BufRead *.txt setfiletype text
  au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
  au BufNewFile,BufRead *.less set filetype=less
  au BufNewFile,BufRead *.gradle set filetype=groovy
  " Drupal *.module and *.install files.
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.test set filetype=php
augroup END
