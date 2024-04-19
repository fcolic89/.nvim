local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = " "

-- NORMAL MODE KEYMAPS
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>w", ":silent w<CR>", opts)
keymap("n", "<leader>Q", ":q!<CR>", opts)
keymap("n", "<C-f>", "<Esc>", opts)

keymap("n", "<leader>cc", ":bd<CR>", opts)
keymap("n", "<leader><leader>", "<C-^>", opts)
keymap("n", "-", ":tabprev<CR>", opts)
keymap("n", "=", ":tabnext<CR>", opts)
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>t", ":lua open_terminal() <CR>", opts)
keymap("n", "<leader>rp", ":lua find_and_replace()<CR>", opts)

-- VISUAL MODE KEYMAPS
keymap("v", "<C-f>", "<Esc>", opts)

-- INSERT MODE KEYMAPS
keymap("i", "<C-f>", "<Esc>", opts)

-- TERMINAL MODE KEYMAPS
keymap("t", "<Esc>", "<C-\\><C-n><CR>", opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h<CR>", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j<CR>", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k<CR>", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l<CR>", opts)
