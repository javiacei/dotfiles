set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent on      " required!
set laststatus=2         " Always show the statusline
set encoding=utf-8             " Necessary to show Unicode glyphs
set t_Co=256                   " Explicitly tell Vim that the terminal supports 256 colors
let mapleader = ','            " remap leader key to ,

set ttyfast
set number
set smartindent
set backspace=indent,eol,start
set cindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set noerrorbells    " do not beep like a crazy bitch
set ignorecase
set cursorline
set textwidth=120
set nolazyredraw    " don't redraw screen while executing macros
set synmaxcol=300   " stop rendering syntax colors in long lines (improves rendering performance)
set ttyscroll=3     " improves redraw performance when scroll
set encoding=utf-8
set fileformat=unix " endline setted to \n
set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files
set incsearch       " find the next match as we type the search
set hlsearch        " hilight searches by default
set history=500     " store commands, search and marks between vim executions

au BufRead,BufNewFile *.twig setfiletype htmldjango

autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" XML AutoFormat
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" folding options
filetype plugin indent on
syntax on
autocmd Filetype * AnyFoldActivate

" directories for .swp files
set directory=~/.vim/swp//,/tmp//
set tags+=tags;/ " search recursively upwards for the tags file
set wildignore=**/cache/**,**/build/**,**/logs/**,**/vendor/**

call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle
" required! 
Plug 'gmarik/vundle'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'L9'
Plug 'mileszs/ack.vim'
Plug 'tomasr/molokai'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/syntastic'
Plug 'honza/vim-snippets'
Plug 'nvie/vim-flake8'
Plug 'moll/vim-node'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'pseewald/vim-anyfold'

" Themes
syntax enable
set background=dark
colorscheme molokai

" Ctrlp
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

if executable('ag')
    let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif executable('ack-grep')
    let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
elseif executable('ack')
    let s:ctrlp_fallback = 'ack %s --nocolor -f'
else
    let s:ctrlp_fallback = 'find %s -type f'
endif

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': s:ctrlp_fallback
\ }

" NERDTree
map <c-e> :NERDTreeToggle<CR>

" syntastic {
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_error_symbol = "✗"
  let g:syntastic_warning_symbol = "⚠"
  let g:syntastic_ruby_checkers = ['mri', 'rubocop']

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
" }

" Add plugins to &runtimepath
call plug#end()
filetype plugin indent on    " required
