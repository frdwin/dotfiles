local set = vim.opt
local autocmd = vim.api.nvim_create_autocmd

local options = {
	number = true,
	numberwidth = 4,
	wildmenu = true,
	ignorecase = true,
	hlsearch = true,
	hidden = true,
	backup = false,
	writebackup = false,
	encoding = 'utf-8',
	fileencoding = 'utf-8',
	pumheight = 10,
	cmdheight = 2,
	expandtab = false,
	shiftwidth = 4,
	softtabstop = 4,
	tabstop = 4,
	splitbelow = true,
	splitright = true,
	smartindent = true,
	smartcase = true,
	autoindent = true,
	laststatus = 0,
	cursorline = true,
	background = 'dark',
	showmode = false,
	updatetime = 300,
	timeoutlen = 500,
	autochdir = true,
	mouse = 'nv',
	foldcolumn = '0',
	signcolumn = 'no',
	termguicolors = true,
	clipboard = 'unnamedplus',
	showtabline = 2,
	swapfile = false,
	undofile = true,
	scrolloff = 8,
	sidescrolloff = 8,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Autoload nvim lua config file on save
--autocmd('BufWritePost', {
--pattern = '*/.config/nvim/**/*.lua',
--command = 'luafile %'
--})
