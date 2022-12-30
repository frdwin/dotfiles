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
		autocmd BufWritePost packer.lua source <afile> | PackerSync
	augroup end
]]

-- Check if packer loading was ok
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Plugins
return packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use 'mhinz/vim-startify'
	use { 'jzelinskie/monokai-soda.vim', requires = 'tjdevries/colorbuddy.vim' }
	use 'morhetz/gruvbox'

	-- Sync plugins after packer installation
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
