vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.relativenumber = true
vim.opt.wildmode = {"full"}
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.ttyfast = true
vim.opt.confirm = true
vim.opt.showcmd = true
vim.opt.wrap = true
vim.opt.autoread = true

vim.cmd.colorscheme('habamax')

-- keymaps
local opts = {noremap=true, silent=true}
local keymap = vim.keymap.set

vim.g.mapleader = " "

-- NORMAL MODE KEYMAPS
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>Q", ":q!<CR>", opts)

-- buffers
keymap("n", "<leader>k", ":ls<CR>", opts)
keymap("n", "<leader>l", ":vsplit | Ex<CR>", opts)
keymap("n", "<leader>e", ":Ex<CR>", opts)
keymap("n", "<leader>c", ":bd<CR>", opts)
keymap("n", "[[", ":bprev<CR>", opts)
keymap("n", "]]", ":bnext<CR>", opts)
keymap("n", "<leader>f", ":b ", opts)
keymap("n", "<C-\\>", ":vsplit<CR>", opts)

-- tabs
keymap("n", "<leader>[", ":tabprev<CR>", opts)
keymap("n", "<leader>]", ":tabnext<CR>", opts)
keymap("n", "<leader>E", ":tabnew | Ex<CR>", opts)

-- panel movements
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- terminal 
keymap("n", "<leader>j", ":belowright split | startinsert | te <CR>", opts)

-- TERMINAL MODE KEYMAPS
keymap("t", "<Esc>", "<C-\\><C-n><CR>", opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h<CR>", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j<CR>", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k<CR>", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l<CR>", opts)

