local set = vim.opt
local autocmd = vim.api.nvim_create_autocmd

set.number = true
set.numberwidth = 4
set.wildmenu = true
set.ignorecase = true
set.hlsearch = true
set.hidden = true
set.backup = false
set.writebackup = false
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'
set.pumheight = 10
set.cmdheight = 2
set.expandtab = false
set.shiftwidth = 4
set.softtabstop = 4
set.tabstop = 4
set.splitbelow = true
set.splitright = true
set.smartindent = true
set.smartcase = true
set.autoindent = true
set.laststatus = 0
set.cursorline = true
set.background = 'dark'
set.showmode = false
set.updatetime = 300
set.timeoutlen = 500
set.autochdir = true
set.mouse = 'nv'
set.foldcolumn = '0'
set.signcolumn = 'no'
set.termguicolors = true
set.clipboard = 'unnamedplus'
set.showtabline = 2
set.swapfile = false
set.undofile = true
set.scrolloff = 8
set.sidescrolloff = 8

-- Autoload nvim lua config file on save
--autocmd('BufWritePost', {
--pattern = '*/.config/nvim/**/*.lua',
--command = 'luafile %'
--})
