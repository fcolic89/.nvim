require("core.mappings")
require("core.set")
require("core.functions")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    { import = 'plugin' },
  },
  defaults = {
    lazy = false,
  },
  change_detection = {
    notify = false,
  },
}, {})

-- load ignored files
for file in io.popen("ls " .. debug.getinfo(1, "S").source:sub(2, -10) .. "/lua/ignore_me/"):lines() do
  if file:sub(-4) == ".lua" then
    require("ignore_me." .. file:sub(1, -5))
  end
end

-- format file on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
