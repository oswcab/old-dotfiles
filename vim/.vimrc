set number
set linebreak		" Break lines at word (requires Wrap lines)
set listchars=tab:▶\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪         " Wrap-broken line prefix
set textwidth=72	" Line wrap (number of cols)
set showmatch		" Highlight matching brace
set showcmd		" Show <leader key has been pressed

set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
set ignorecase		" Always case-insensitive
set incsearch	    " Searches for strings incrementally

set autoindent	    " Auto-indent new lines
"set expandtab	    " Use spaces instead of tabs
set shiftwidth=2    " Number of auto-indent spaces
set smartindent	    " Enable smart-indent
set smarttab	    " Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab

set ruler	        " Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=72
filetype plugin on
syntax on
colo peachpuff
highlight Comment ctermfg=DarkGrey
highlight LineNr ctermfg=grey
highlight String ctermfg=Blue
match ErrorMsg '\s\+$'

" Plugins
call plug#begin('~/vimrc/plugins') "vim-plug configuration

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'neomake/neomake'

" Surround
Plug 'tpope/vim-surround'

" Comment out code
Plug 'scrooloose/nerdcommenter'

" Completion
Plug 'zchee/deoplete-jedi'

" NerdTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Systemd syntax
Plug 'Matt-Deacalion/vim-systemd-syntax'

call plug#end()

let g:syntastic_sh_checkers = ['shellcheck']
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
call neomake#configure#automake('nrwi', 500)

" Configure NERDTree
nnoremap \f :NERDTreeFind<CR>
nnoremap \n :NERDTreeToggle<CR>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Open tree when vim is called without a file name
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close NERDTree when a file is opened
"let NERDTreeQuitOnOpen = 1 " Not sure is a good idea now.

" Close NERDTree when it is the last open tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Avoid wrong syntax coloring on .template files
autocmd BufNewFile,BufRead *.template set syntax=off

