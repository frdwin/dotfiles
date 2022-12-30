local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer... Close and reopen Neovim."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand to reload nvim whenever packer.lua file is saved
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Check if packer loading was ok
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("error loading packer!")
	return
end

-- Plugins
return packer.startup(function(use)
	use {
		"wbthomason/packer.nvim",

		-- Lualine
		{ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true }},

		-- Colorscheme
		"lunarvim/colorschemes",

		-- Auto-Completion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",

		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",

		-- LSP
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"RRethy/vim-illuminate",
		{ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" },

		-- Autopairs
		"windwp/nvim-autopairs",

		-- Treesitter
		{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	}

	-- Sync plugins after packer installation
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
