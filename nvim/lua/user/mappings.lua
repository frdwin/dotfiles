local map = vim.api.nvim_set_keymap
local silent_opts = { noremap = true, silent = true }
local opts = { noremap = true }

-- Leader key
map("n", "<Space>", "", {})
vim.g.mapleader = " "

-- General mappings
map("i", "jk", "<Esc>", opts)
map("n", ";", ":", opts)
map("v", ";", ":", opts)

-- Save on Ctrl+S
map("n", "<C-s>", ":w<CR>", opts)

-- Navigation
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<up>", ":resize +2<CR>", opts)
map("n", "<down>", ":resize -2<CR>", opts)
map("n", "<left>", ":vertical resize -2<CR>", opts)
map("n", "<right>", ":vertical resize +2<CR>", opts)

map("n", "<tab>", ":bn<CR>", opts)
map("n", "<s-tab>", ":bp<CR>", opts)
map("n", "<leader>q", ":bd<CR>", opts)

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Indent on visual mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down on visual mode
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Cancel search highlight
map("n", "<leader>h", ":nohl<CR>", opts)
-- Paste from last copy
map("n", ",p", '"0p', opts)
map("n", ",P", '"0P', opts)

-- Startify
map("n", "<leader>s", ":Startify<CR>", opts)
