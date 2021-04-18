local utils = require('utils')

utils.map('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
utils.map('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
utils.map('n', '<S-x>', ':BufferClose<CR>', { noremap = true, silent = true })
