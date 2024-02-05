local opts1 = {noremap=true, silent=true}
local opts2 = {silent=true}
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- NORMAL MODE KEYMAPS
keymap("n", "<leader>q", ":q<CR>", opts1)
keymap("n", "<leader>w", ":w<CR>", opts1)
keymap("n", "<leader>j", ":belowright split | startinsert | te <CR>", opts1)
keymap("n", "<leader>l", ":vsplit | startinsert | te <CR>", opts1)
keymap("n", "<leader>T", ":te<CR>", opts1)
-- keymap("n", "<leader>e", ":tabnew | Ex<CR>", opts)
-- keymap("n", "<leader>E", ":Ex<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts1)
keymap("n", "<leader>o", ":NvimTreeFocus<CR>", opts1)
keymap("n", "<leader>c", ":bd<CR>", opts1)
keymap("n", "[", ":tabprevious<CR>", opts1)
keymap("n", "]", ":tabnext<CR>", opts1)
keymap("n", "<leader>v", ":vsplit<CR>", opts1)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts1)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts1)

keymap("n", "<A-h>", "<C-w>h", opts1)
keymap("n", "<A-j>", "<C-w>j", opts1)
keymap("n", "<A-k>", "<C-w>k", opts1)
keymap("n", "<A-l>", "<C-w>l", opts1)

keymap("n", "<leader>/", "gcc<CR>", opts2)


-- VISUAL MODE KEYMAPS
keymap("v", "<leader>/", "gc<CR>", opts2)


-- TERMINAL MODE KEYMAPS
keymap("t", "<Esc>", "<C-\\><C-n><CR>", opts2)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h<CR>", opts2)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j<CR>", opts2)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k<CR>", opts2)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l<CR>", opts2)


