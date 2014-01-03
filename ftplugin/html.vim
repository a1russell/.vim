setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
if has("autocmd")
  augroup omnicomplete
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  augroup END
endif
