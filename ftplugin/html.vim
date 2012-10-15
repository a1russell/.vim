if has("autocmd")
  augroup omnicomplete
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  augroup END
endif
