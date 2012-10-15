setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal smarttab
setlocal expandtab
setlocal autoindent
if has("autocmd")
  augroup omnicomplete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  augroup END
endif
