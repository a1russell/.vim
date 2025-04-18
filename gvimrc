" Set color scheme
silent! colorscheme selenized

if filereadable(vimhome . '/gvimrc.local')
  execute 'source ' . vimhome . '/gvimrc.local'
endif
