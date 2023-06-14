local opts = {noremap=true, silent=true}
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
