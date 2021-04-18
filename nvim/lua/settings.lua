local utils = require('utils')

local indent = 4
set_option('o', 'autoread', true)                   -- Reloads a file if changed out of vim
set_option('b', 'autoindent', true)                 -- Auto-indent new lines
set_option('o', 'backspace', 'indent,eol,start')    -- Backspace behaviour
set_option('o', 'clipboard', 'unnamedplus')         -- Use the system clipboard
set_option('b', 'expandtab', true)                  -- Use spaces instead of tabs
set_option('o', 'foldmethod', 'syntax')
set_option('o', 'hidden', true)                     -- Enable modified buffers in background
set_option('o', 'hlsearch', true)                   -- Highlight all search results
set_option('o', 'ignorecase', true)                 -- Ignore case
set_option('o', 'incsearch', true)                  -- Searches for strings incrementally
set_option('o', 'joinspaces', false)                -- No double spaces with join after a dot
set_option('w', 'linebreak', true)                  -- Break lines at word (requires Wrap lines)
set_option('w', 'list', true)                       -- Show some invisible characters (tabs...)
set_option('o', 'listchars' 'tab:▶\ ,eol:¬,trail:⋅,extends:❯,precedes:❮')
set_option('o', 'nofoldenable', true)
set_option('o', 'nrformats', true)                  -- Treat numerals as decimals, not octals
set_option('w', 'number', true)                     -- Print line number
set_option('w', 'relativenumber', true)             -- Relative line numbers
set_option('o', 'ruler', true)                      -- Show row and column ruler information
set_option('o', 'scrolloff', 4 )                    -- Lines of context
set_option('b', 'shiftwidth', indent)               -- Size of an indent
set_option('o', 'shiftround', true)                 -- Round indent
set_option('o', 'showbreak', '↪')                   -- Wrap-broken line prefix
set_option('o', 'showcmd', true)                    -- Show <leader key has been pressed
set_option('o', 'showmatch', true)                  -- Highlight matching brace
set_option('o', 'sidescrolloff', 8 )                -- Columns of context
set_option('o', 'smartcase', true)                  -- Don't ignore case with capitals
set_option('o', 'smarttab', true)                   -- Don't ignore case with capitals
set_option('b', 'smartindent', true)                -- Insert indents automatically
set_option('b', 'softtabstop', indent)              -- Insert indents automatically
set_option('o', 'splitbelow', true)                 -- Put new windows below current
set_option('o', 'splitright', true)                 -- Put new windows right of current
set_option('b', 'tabstop', indent)                  -- Number of spaces tabs count for
set_option('o', 'termguicolors', true)              -- True color support
set_option('o', 'textwidth', 100)                   -- Line wrap (number of cols)
set_option('o', 'undolevels', 1000)                 -- Number of undo levels
set_option('o', 'wildmode', 'list:longest')         -- Command-line completion mode
set_option('w', 'wrap', false)                      -- Disable line wrap

