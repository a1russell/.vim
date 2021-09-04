" Set color scheme
set background=dark
colorscheme selenized

if filereadable(vimhome . '/gvimrc.local')
  execute 'source ' . vimhome . '/gvimrc.local'
endif
