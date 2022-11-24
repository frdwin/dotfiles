return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use 'mhinz/vim-startify'
	use { 'jzelinskie/monokai-soda.vim', requires = 'tjdevries/colorbuddy.vim' }
	use 'morhetz/gruvbox'
end)
