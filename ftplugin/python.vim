setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
setlocal nosmartindent
if has("autocmd")
  augroup omnicomplete
    autocmd FileType python set omnifunc=pythoncomplete#Complete
  augroup END
endif
