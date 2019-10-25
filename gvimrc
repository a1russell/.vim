" Set toggle paste mode to default
set pastetoggle&

" Set maximum number of tabs to open at once
set tabpagemax=25

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Set color scheme
set background=dark
colorscheme solarized8

" Enable right-click context menu
set mousemodel=popup

" Enable horizontal scrollbar
set guioptions+=b

if has("autocmd")
  " Auto-save files when focus is lost
  au FocusLost * silent! wa
endif

if filereadable(vimhome . '/gvimrc.local')
  execute 'source ' . vimhome . '/gvimrc.local'
endif
