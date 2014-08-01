let vimhome = $HOME . '/.vim'

set nocompatible " Use Vim defaults instead of 100% vi compatibility

" Vundle config setup
filetype off
let &rtp .= ',' . vimhome . '/bundle/vundle'
call vundle#rc()
Plugin 'gmarik/vundle'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'bufkill.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'embear/vim-localvimrc'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'elzr/vim-json'
Plugin 'ingydotnet/yaml-vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'derekwyatt/vim-scala'
Plugin 'dag/vim2hs'
Plugin 'vim-scripts/groovy.vim--Ruley'
Plugin 'wting/rust.vim'
Plugin 'pbrisbin/html-template-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'tpope/vim-haml'
Plugin 'groenewege/vim-less'
Plugin 'rodjek/vim-puppet'
Plugin 'LaTeX-Box-Team/LaTeX-Box'

" Config
set backspace=indent,eol,start " more powerful backspacing
set nowrap " disable line wrapping
syntax on " enable syntax highlighting
filetype plugin indent on " enable filetype-specific plugins and indenting
set secure " disable unsafe commands
set hidden " hide, rather than unload, buffers upon abandonment
let mapleader = "," " leader key
set ruler " line and column number#
set autoread " reload changed files
set nofoldenable " disable code folding

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
nmap <leader>d :execute 'NERDTreeToggle "' . getcwd() . '"'<CR>

" EasyMotion leader key
let g:EasyMotion_leader_key = '<Leader>'

" Disable pep8 plugin if pep8 executable doesn't exist.
if ! executable("pep8")
  let g:pep8_map="\u0000"
endif

" Enable only specific javascript libraries.
let g:used_javascript_libs = 'jquery,angularjs,requirejs'

if has("autocmd")
  " Set absolute line numbers in insert mode, relative otherwise
  augroup linenumbers
    set rnu
    au InsertEnter * :set nu
    au InsertLeave * :set rnu
  augroup END

  " Strip trailing whitespace on save
  augroup striptrailingws
    autocmd FileType scala,java,haskell,rust,c,cpp,
                    \ruby,python,javascript,groovy,php,
                    \html,htmldjango,eruby,css,less,sass,scss,
                    \yaml,xml,puppet
                    \ set fileformat=unix
    autocmd FileType scala,java,haskell,rust,c,cpp,
                    \ruby,python,javascript,groovy,php,
                    \html,htmldjango,eruby,css,less,sass,scss,
                    \yaml,xml,puppet
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

if filereadable(vimhome . '/vimrc.local')
  execute 'source ' . vimhome . '/vimrc.local'
endif
