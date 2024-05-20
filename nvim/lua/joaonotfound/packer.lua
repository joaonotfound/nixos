-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use "rose-pine/neovim"
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use("theprimeagen/harpoon")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("mfussenegger/nvim-jdtls")

  use("savq/melange-nvim")

  use ('numToStr/Comment.nvim')

  use("lewis6991/gitsigns.nvim")

  use("nvim-tree/nvim-tree.lua")

  use('m4xshen/autoclose.nvim')

  use('stevearc/conform.nvim')

  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},
		  {'neovim/nvim-lspconfig'},
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }
end)

