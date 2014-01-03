call pathogen#infect('bundle-pathogen') " Manipulate runtime path via Pathogen
set nocompatible " Use Vim defaults instead of 100% vi compatibility

" Vundle config setup
filetype off
set rtp+=${HOME}/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle 'scrooloose/nerdtree'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'bufkill.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'embear/vim-localvimrc'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ervandew/supertab'
Bundle 'vim-ruby/vim-ruby'
Bundle 'derekwyatt/vim-scala'
Bundle 'dag/vim2hs'
Bundle 'vim-scripts/groovy.vim--Ruley'
Bundle 'wting/rust.vim'
Bundle 'pbrisbin/html-template-syntax'
Bundle 'rodjek/vim-puppet'

" Config
set backspace=indent,eol,start " more powerful backspacing
set nowrap " disable line wrapping
syntax on " enable syntax highlighting
filetype plugin indent on " enable filetype-specific plugins and indenting
set secure " disable unsafe commands
set hidden " hide, rather than unload, buffers upon abandonment
let mapleader = "," " leader key
set ruler " line and column number#

" Set clipboard
if has('unnamedplus') &&
  \has('unix') &&
  \'Darwin' != system('echo -n "$(uname)"')
  set clipboard=unnamedplus
else
  " one mac and windows, use * register for copy-paste
  set clipboard=unnamed
endif

" Improved searching
set ignorecase
set smartcase
set incsearch

" Make ctrl-insert copy
map <C-Insert> "*y
map! <C-Insert> "*y

" Map NERD Tree to \d
nmap <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" EasyMotion leader key
let g:EasyMotion_leader_key = '<Leader>'

" Disable pep8 plugin if pep8 executable doesn't exist.
if ! executable("pep8")
  let g:pep8_map="\u0000"
endif

if has("autocmd")
  " Set absolute line numbers in insert mode, relative otherwise
  augroup linenumbers
    set rnu
    au InsertEnter * :set nu
    au InsertLeave * :set rnu
  augroup END

  " Strip trailing whitespace on save
  augroup striptrailingws
    autocmd FileType python,ruby,haskell,c,cpp,java,javascript,
                    \php,html,htmldjango,eruby,css,less,yaml
                    \ set fileformat=unix
    autocmd FileType python,ruby,haskell,c,cpp,java,javascript,
                    \php,html,htmldjango,eruby,css,less,yaml
                    \ autocmd BufWritePre <buffer>
                    \ :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
  augroup END

  " Automatically open and close the completion popup menu & preview window
  " Only insert the longest common text of the matches
  augroup completionmenu
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set completeopt=menuone,menu,longest,preview
  augroup END
endif

" Set omni completion menu selection color to dark red on console
highlight PmenuSel ctermbg=1
" Set PyFlakes error color to dark gray on console
highlight PyFlakes ctermbg=0

" Set SuperTab to complete based on context (omni completion friendly)
let g:SuperTabDefaultCompletionType="context"

if has('gui_running')
  " Set maximum number of tabs to open at once
  set tabpagemax=25

  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>

  " Set color scheme
  colorscheme torte

  " Enable right-click context menu
  set mousemodel=popup

  " Enable horizontal scrollbar
  set guioptions+=b

  if has("autocmd")
    " Auto-save files when focus is lost
    au FocusLost * silent! wa
  endif
else
  " Make F2 toggle paste mode
  set pastetoggle=<F2>
endif
