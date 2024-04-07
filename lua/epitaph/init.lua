require("epitaph.remap")
require("epitaph.set")


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	'theprimeagen/harpoon',
	'mbbill/undotree',
	'tpope/vim-fugitive',
	'williamboman/mason.nvim',
    	'williamboman/mason-lspconfig.nvim',
	'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
   	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/nvim-cmp',
	'L3MON4D3/LuaSnip',
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
	{'rose-pine/neovim', name = 'rose-pine'},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	}
}

require("lazy").setup(plugins, opts)
