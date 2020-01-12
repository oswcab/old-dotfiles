set autoread            " Reloads a file if changed out of vim
set number relativenumber "Hybrid numbers"
set linebreak           " Break lines at word (requires Wrap lines)
set listchars=tab:▶\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪         " Wrap-broken line prefix
set textwidth=72        " Line wrap (number of cols)
set showmatch           " Highlight matching brace
set showcmd             " Show <leader key has been pressed
set nrformats=          " Treat numerals as decimals, not octals

set hlsearch            " Highlight all search results
set smartcase           " Enable smart-case search
set ignorecase          " Always case-insensitive
set incsearch       " Searches for strings incrementally

set autoindent      " Auto-indent new lines
set expandtab       " Use spaces instead of tabs
set shiftwidth=2    " Number of auto-indent spaces
set smartindent     " Enable smart-indent
set smarttab        " Enable smart-tabs
set softtabstop=2   " Number of spaces per Tab

set ruler               " Show row and column ruler information
set undolevels=1000     " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
set hidden

au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=72
filetype plugin on
syntax on
match ErrorMsg '\s\+$'

" Plugins
call plug#begin('~/.config/nvim/plugins') "vim-plug configuration

" Status bar
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

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

" fuzzyfinder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" vim-go
Plug 'fatih/vim-go'

" ConquerOfCompletion plugin
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

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
let NERDTreeShowHidden=1
let NERDTreeWinSize=50

" Close NERDTree when a file is opened
"let NERDTreeQuitOnOpen = 1 " Not sure is a good idea now.

" Close NERDTree when it is the last open tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Avoid wrong syntax coloring on .template files
autocmd BufNewFile,BufRead *.template set syntax=off

" Avoid expanding tabs when opening go files
autocmd BufNewFile,BufRead *.go set noexpandtab

" Use absolute numbers when inserting or when the windows
" lose focus. Otherwise, use relative hybrid numbers.
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Disable arrow keys within vim
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Enables Esc to get out of terminal mode
if has ('nvim')
  " Terminal mode:
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v> <Esc> <Esc>
  tnoremap <C-h> <c-\><c-n><c-w>h
  tnoremap <C-j> <c-\><c-n><c-w>j
  tnoremap <C-k> <c-\><c-n><c-w>k
  tnoremap <C-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <C-h> <Esc><C-w>h
  inoremap <C-j> <Esc><C-w>j
  inoremap <C-k> <Esc><C-w>k
  inoremap <C-l> <Esc><C-w>l
  " Visual mode:
  vnoremap <C-h> <Esc><c-w>h
  vnoremap <C-j> <Esc><c-w>j
  vnoremap <C-k> <Esc><c-w>k
  vnoremap <C-l> <Esc><c-w>l
endif

" Simplify moving between open windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" coc.nvim default settings
" =============================================

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

colorscheme monokai
hi Normal ctermbg=none
highlight Comment ctermfg=DarkGrey
highlight LineNr ctermfg=grey
highlight Search ctermfg=White ctermbg=DarkYellow
