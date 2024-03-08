local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = " "

-- NORMAL MODE KEYMAPS
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>Q", ":q!<CR>", opts)

keymap("n", "<leader>j", ":belowright split | startinsert | te <CR>", opts)
-- keymap("n", "<leader>e", ":tabnew | Ex<CR>", opts)
-- keymap("n", "<leader>E", ":Ex<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>o", ":NvimTreeFocus<CR>", opts)
keymap("n", "<leader>cc", ":bd<CR>", opts)
keymap("n", "<leader>k", ":ls<CR>", opts)
keymap("n", "[[", ":bprev<CR>", opts)
keymap("n", "]]", ":bnext<CR>", opts)
keymap("n", "<C-\\>", ":vsplit<CR>", opts)
keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>l", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>[", ":tabprev<CR>", opts)
keymap("n", "<leader>]", ":tabnext<CR>", opts)
keymap("n", "<leader>rp", ":lua find_and_replace()<CR>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- INSERT MODE KEYMAPS
keymap("i", "<C-c>", "<Esc>", opts)

-- TERMINAL MODE KEYMAPS
keymap("t", "<Esc>", "<C-\\><C-n><CR>", opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h<CR>", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j<CR>", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k<CR>", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l<CR>", opts)
