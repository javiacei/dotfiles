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
set foldmethod=syntax
set foldlevel=0
set foldcolumn=3
let javaScript_fold=1
let xml_syntax_folding=1

" directories for .swp files
set directory=~/.vim/swp//,/tmp//
set tags+=tags;/ " search recursively upwards for the tags file
set wildignore=**/cache/**,**/build/**,**/logs/**,**/vendor/**

call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle
" required! 
Plug 'gmarik/vundle'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/phpvim'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'L9'
Plug 'FuzzyFinder'
Plug 'bling/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'othree/yajs.vim'
Plug 'tomasr/molokai'
Plug 'shime/vim-livedown'
Plug 'scrooloose/syntastic'

" Themes
syntax enable
set background=dark
" colorscheme Tomorrow-Night-Eighties
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

" PHP for Vim
let php_sql_query = 1
let php_htmlInStrings = 1
let php_parent_error_close = 1
let php_folding = 3
let php_baselib = 1
let php_special_vars = 1

" Tagbar
map <F2> :TagbarToggle<CR>
let g:tagbar_iconchars = ['▾', '▸']
let g:tagbar_foldlevel = 1
let g:tagbar_autofocus = 1


" vim-airline {
    " Set configuration options for the statusline plugin vim-airline.
    " Use the powerline theme and optionally enable powerline symbols.
    " To use the symbols , , , , , , and .in the statusline
    " segments add the following to your .vimrc.before.local file:
    "   let g:airline_powerline_fonts=1
    let g:airline_powerline_fonts=1

    " If the previous symbols do not render for you then install a
    " powerline enabled font.

    " See `:echo g:airline_theme_map` for some more choices
    " Default in terminal vim is 'dark'
    if isdirectory(expand("~/.vim/bundle/vim-airline/"))
        if !exists('g:airline_theme')
            let g:airline_theme = 'tomorrow'
        endif
        if !exists('g:airline_powerline_fonts')
            " Use the default set of separators with a few customizations
            let g:airline_left_sep='›'  " Slightly fancier than '>'
            let g:airline_right_sep='‹' " Slightly fancier than '<'
        endif
    endif
"" }

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
