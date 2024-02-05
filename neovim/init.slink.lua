require("core.mappings")
require("core.set")
require("core.functions")
-- plugins
require("plugin.plugins")
require("plugin.autopairs")
require("plugin.lualine")
require("plugin.telescope")
require("plugin.nvimtree")
require("plugin.lspzero")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


