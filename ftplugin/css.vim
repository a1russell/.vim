setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal autoindent
if has("autocmd")
  augroup omnicomplete
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  augroup END
endif
