local utils = require('utils')

require('nvim_comment').setup()

utils.map("n", "<leader>/", ":CommentToggle<CR>", {noremap=true, silent = true})
utils.map("v", "<leader>/", ":CommentToggle<CR>", {noremap=true, silent = true})
