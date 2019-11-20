let vimhome = expand('<sfile>:p:h')

set nocompatible  " Use Vim defaults instead of 100% vi compatibility

" vim-plug config setup
call plug#begin(vimhome . '/bundle')

" Plugins
Plug 'lifepillar/vim-solarized8'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'fholgado/minibufexpl.vim'
Plug 'vim-scripts/bufkill.vim'
Plug 'scrooloose/syntastic'
Plug 'mihaifm/bufstop'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'embear/vim-localvimrc'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'Lokaltog/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'rking/ag.vim'
Plug 'elzr/vim-json'
Plug 'ingydotnet/yaml-vim'
Plug 'chase/vim-ansible-yaml'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'vim-ruby/vim-ruby'
Plug 'derekwyatt/vim-scala'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'dag/vim2hs'
Plug 'udalov/kotlin-vim'
Plug 'wting/rust.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'

call plug#end()

" Config
set backspace=indent,eol,start  " more powerful backspacing
set nowrap  " disable line wrapping
syntax on  " enable syntax highlighting
filetype plugin indent on  " enable filetype-specific plugins and indenting
set secure  " disable unsafe commands
set hidden  " hide, rather than unload, buffers upon abandonment
let mapleader = ","  " leader key
set ruler  " line and column number#
set autoread  " reload changed files

" Disable clipboard usage for deletes
nnoremap d "_d
xnoremap d "_d
nnoremap D "_D
xnoremap D "_D
nnoremap C "_C
xnoremap C "_C
nnoremap c "_c
xnoremap c "_c

" Set clipboard
if has('unnamedplus') &&
  \has('unix') &&
  \'Darwin' != system('echo -n "$(uname)"')
  set clipboard=unnamedplus
  " Mappings for deletion to clipboard
  nnoremap <leader>d "+d
  xnoremap <leader>d "+d
  nnoremap <leader>D "+D
  xnoremap <leader>D "+D
else
  " one mac and windows, use * register for copy-paste
  set clipboard=unnamed
  " Mappings for deletion to clipboard
  nnoremap <leader>d "*d
  xnoremap <leader>d "*d
  nnoremap <leader>D "*D
  xnoremap <leader>D "*D
endif

" Improved searching
set ignorecase
set smartcase
set incsearch

" Make ctrl-insert copy
map <C-Insert> "*y
map! <C-Insert> "*y

" Bufstop key mappings for buffer switching
map <leader>b :Bufstop<CR>
map <leader>a :BufstopModeFast<CR>
let g:BufstopAutoSpeedToggle = 1

" Map NERD Tree to alt-1
nmap <A-1> :execute 'NERDTreeToggle "' . getcwd() . '"'<CR>

" Automatically delete a file buffer upon deletion via NERDTree
let NERDTreeAutoDeleteBuffer = 1

" EasyMotion leader key
let g:EasyMotion_leader_key = '<Leader>'

" Disable pep8 plugin if pep8 executable doesn't exist.
if ! executable("pep8")
  let g:pep8_map="\u0000"
endif

" Prefer Python 3 syntax checking over Python 2
let g:pymode_python = 'python3'

" Disable JSON quote conceal
let g:vim_json_syntax_conceal = 0

if has("autocmd")
  " Set absolute line numbers in insert mode, relative otherwise
  augroup linenumbers
    set rnu
    au InsertEnter * :set nu
    au InsertLeave * :set rnu
  augroup END

  let s:sourceFileTypes =
    \[ 'c'
    \, 'cpp'
    \, 'css'
    \, 'haskell'
    \, 'html'
    \, 'java'
    \, 'javascript'
    \, 'json'
    \, 'kotlin'
    \, 'python'
    \, 'ruby'
    \, 'rust'
    \, 'sass'
    \, 'scss'
    \, 'scala'
    \, 'typescript'
    \, 'xml'
    \, 'yaml'
    \]

  " Strip trailing whitespace on save
  augroup striptrailingws
    execute "autocmd FileType " . join(s:sourceFileTypes, ",") . " set fileformat=unix"
    execute "autocmd FileType " . join(s:sourceFileTypes, ",") . " autocmd BufWritePre <buffer> " .
           \':call setline(1,map(getline(1,"$"),''substitute(v:val,"\\s\\+$","","")''))'
  augroup END

  " Automatically open and close the completion popup menu & preview window
  " Only insert the longest common text of the matches
  augroup completionmenu
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set completeopt=menuone,menu,longest,preview
  augroup END

  " Start with code folds open by default
  augroup opencodefolds
    execute "autocmd Syntax " . join(s:sourceFileTypes, ",") . " setlocal foldmethod=syntax"
    execute "autocmd Syntax " . join(s:sourceFileTypes, ",") . " normal zR"
  augroup END
endif

" Set omni completion menu selection color to dark red on console
highlight PmenuSel ctermbg=1
" Set PyFlakes error color to dark gray on console
highlight PyFlakes ctermbg=0

" Set SuperTab to complete based on context (omni completion friendly)
let g:SuperTabDefaultCompletionType="context"

" Make F2 toggle paste mode
set pastetoggle=<F2>

if filereadable(vimhome . '/vimrc.local')
  execute 'source ' . vimhome . '/vimrc.local'
endif
