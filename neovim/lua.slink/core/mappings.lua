local opts = {noremap=true, silent=true}
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
-- keymap("n", "<leader>e", ":tabnew | Ex<CR>", opts)
-- keymap("n", "<leader>E", ":Ex<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>o", ":NvimTreeFocus<CR>", opts)
keymap("n", "<leader>c", ":bd<CR>", opts)
keymap("n", "<leader>n", "gt<CR>", opts)
keymap("n", "<leader>b", "gT<CR>", opts)
keymap("n", "<leader>v", ":vsplit<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

