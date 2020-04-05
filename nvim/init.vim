set autoread                    " Reloads a file if changed out of vim
set backspace=indent,eol,start  " Backspace behaviour
set hidden
set linebreak                   " Break lines at word (requires Wrap lines)
set listchars=tab:▶\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set nrformats=                  " Treat numerals as decimals, not octals
set number relativenumber       " Hybrid numbers
set ruler                       " Show row and column ruler information
set scrolloff=1                 " Keep at least two visible lines above and below
set showbreak=↪                 " Wrap-broken line prefix
set showcmd                     " Show <leader key has been pressed
set showmatch                   " Highlight matching brace
set splitbelow                  " Open horizontal split below
set splitright                  " Open vertical split to the right
set termguicolors               " Enable true colors support
set textwidth=80                " Line wrap (number of cols)
set undolevels=1000             " Number of undo levels

set hlsearch                    " Highlight all search results
set ignorecase                  " Always case-insensitive
set incsearch                   " Searches for strings incrementally
set smartcase                   " Enable smart-case search

set autoindent                  " Auto-indent new lines
set expandtab                   " Use spaces instead of tabs
set shiftwidth=2                " Number of auto-indent spaces
set smartindent                 " Enable smart-indent
set smarttab                    " Enable smart-tabs
set softtabstop=2               " Number of spaces per Tab

au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=72
filetype plugin on
match ErrorMsg '\s\+$'
syntax on

"colorscheme monokai
"hi Normal ctermbg=none
"highlight Comment ctermfg=DarkGrey

function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=11 ctermfg=0 guibg=#FFFF00 guifg=#000000
    hi! BuffetBuffer cterm=NONE ctermbg=16 ctermfg=2 guibg=#262626 guifg=#00FFAF
endfunction

" Plugins
call plug#begin('~/.config/nvim/plugins') "vim-plug configuration

" Status bar
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Surround
Plug 'tpope/vim-surround'

" Comment out code
Plug 'preservim/nerdcommenter'

" NerdTree
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }

" fuzzyfinder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" vim-go
Plug 'fatih/vim-go'

" color theme
Plug 'fatih/molokai'

" ConquerOfCompletion plugin
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" vim-buffet eases handling buffers and tabs
Plug 'bagrat/vim-buffet'

" vim dev-icons
Plug 'ryanoasis/vim-devicons'

" fugitive - git integration
Plug 'tpope/vim-fugitive'

call plug#end()

colorscheme molokai
let g:rehash256 = 1
set guifont=DroidSansMono\ Nerd\ Font\ 12

let g:syntastic_sh_checkers = ['shellcheck']
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

"call neomake#configure#automake('nrwi', 500)

" Configure NERDTree
nnoremap \f :NERDTreeFind<CR>
nnoremap \n :NERDTreeToggle<CR>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let NERDTreeWinSize=50
let g:NERDTreeHijackNetrw = 1

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

" Remap Esc to jk in insert mode
inoremap jk <Esc>

"== vim-go syntax hightlight ==
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" vim-go configuration
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1


" Open nvim configuration when using \v
nnoremap <Leader>v :vsp $MYVIMRC<cr>

" coc.nvim default settings
" =============================================

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

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>t  <Plug>(coc-format-selected)
nmap <leader>t  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

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

" disable vim-go :GoDef short cut (gd) (handled by LanguageClient)
let g:go_def_mapping_enabled = 0

" vim-buffet mappings
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

" vim-buff configuration
let g:buffet_always_show_tabline = 1
let g:buffet_powerline_separators = 1
let g:buffet_show_index = 1
let g:buffet_use_devicons = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

" fugitive.vim configuration

" git blame
nnoremap <Leader>gb :Gblame<CR>

" Customize theme
highlight LineNr ctermfg=grey
