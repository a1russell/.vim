setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
setlocal autoindent
if has("autocmd")
  augroup omnicomplete
    autocmd FileType ruby set omnifunc=rubycomplete#Complete
  augroup END
endif
