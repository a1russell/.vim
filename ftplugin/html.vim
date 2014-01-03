setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
if has("autocmd")
  augroup omnicomplete
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  augroup END
endif
let g:syntastic_html_tidy_ignore_errors = [
  \"trimming empty <i>",
  \"trimming empty <span>",
  \"<input> proprietary attribute \"autocomplete\"",
  \"proprietary attribute \"ng-",
  \"proprietary attribute \"role\"",
  \"proprietary attribute \"hidden\"",
\]
