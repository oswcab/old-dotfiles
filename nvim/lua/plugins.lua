-- Install packer
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd [[packadd packer.nvim]]
vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  -- Packer can manage itself
  use {'wbthomason/packer.nvim', opt = true}

  -- Autocomplete
  use 'hrsh7th/nvim-compe'

  -- Autopairs
  use 'jiangmiao/auto-pairs'

  -- Bufferline
  use 'romgrk/barbar.nvim'

  -- Comment out code
  use "terrortylor/nvim-comment"
  require('nvim_comment').setup()

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Git
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
  use 'f-person/git-blame.nvim'
  use 'tpope/vim-fugitive'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'kabouzeid/nvim-lspinstall'

  -- Status Line
  --use { 'glepnir/galaxyline.nvim', config = my('galaxyline') } -- TODO: create config file
  use 'vim-airline/vim-airline'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
  use {"windwp/nvim-ts-autotag", opt = true}

  -- Whitespace removal
  use { 'ntpeters/vim-better-whitespace',
        config = function()
            vim.g["better_whitespace_enabled"] = 1
	    vim.g["strip_whitespace_on_save"] =1
        end
  }

  -- Yank help
  use 'ojroques/vim-oscyank'

end)
