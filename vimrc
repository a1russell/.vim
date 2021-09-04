let vimhome = expand('<sfile>:p:h')

set nocompatible  " Use Vim defaults instead of 100% vi compatibility

" vim-plug config setup
call plug#begin(vimhome . '/bundle')

" Plugins
Plug 'jan-warchol/selenized', { 'rtp': 'editors/vim' }
Plug 'vim-scripts/bufkill.vim'

call plug#end()

if !has('nvim')
  source $VIMRUNTIME/defaults.vim
endif

" Config
" This section is purposefully empty.

if filereadable(vimhome . '/vimrc.local')
  execute 'source ' . vimhome . '/vimrc.local'
endif
