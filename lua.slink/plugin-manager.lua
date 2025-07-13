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

local config_path = vim.fn.stdpath('config')
local plugin_spec = {
  { import = 'plugin' }
}

-- include custom plugins, if they exist
if os.execute('ls ' .. config_path .. '/plugin/custom' .. ' | grep -q .lua') == 0 then
  table.insert(plugin_spec, { import = 'plugin/custom' })
end

require('lazy').setup({
  spec = plugin_spec,
  defaults = {
    lazy = false,
  },
  change_detection = {
    notify = false,
  },
}, {})
