local utils = require('utils')

-- Prevent entering ex mode accidentally
utils.map('n', 'Q', '<Nop>')

-- Disable arrow keys within vim
utils.map('', '<Up>', '<Nop>')
utils.map('', '<Down', '<Nop>')
utils.map('', '<Left', '<Nop>')
utils.map('', '<Right', '<Nop>')

-- Simplify moving between open windows
utils.map('', '<C-h>', '<C-w>h')
utils.map('', '<C-j>', '<C-w>j')
utils.map('', '<C-k>', '<C-w>k')
utils.map('', '<C-l>', '<C-w>l')

-- Use TAB and Shift-TAB to move between buffers
utils.map('n', '<TAB>', ':bnext<CR>')
utils.map('n', '<S-TAB>', ':bprevious<CR>')

-- Remap Esc to jk in insert mode
utils.map('i', 'jk', '<Esc>')

-- Enables Esc to get out of terminal mode
-- Terminal mode:
utils.map('t', '<Esc>', '<C-\><C-n>')
utils.map('t', '<C-v>', '<Esc> <Esc>')
utils.map('t', '<C-h>', '<c-\><c-n><c-w>h')
utils.map('t', '<C-j>', '<c-\><c-n><c-w>j')
utils.map('t', '<C-k>', '<c-\><c-n><c-w>k')
utils.map('t', '<C-l>', '<c-\><c-n><c-w>l')
-- Insert mode:
utils.map('i', '<C-h>', '<Esc><C-w>h')
utils.map('i', '<C-j>', '<Esc><C-w>j')
utils.map('i', '<C-k>', '<Esc><C-w>k')
utils.map('i', '<C-l>', '<Esc><C-w>l')
-- Visual mode:
utils.map('v', '<C-h>', '<Esc><c-w>h')
utils.map('v', '<C-j>', '<Esc><c-w>j')
utils.map('v', '<C-k>', '<Esc><c-w>k')
utils.map('v', '<C-l>', '<Esc><c-w>l')

