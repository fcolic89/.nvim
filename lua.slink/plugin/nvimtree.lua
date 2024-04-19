-- empty setup using defaults
return {
  'nvim-tree/nvim-tree.lua',
  dependecies = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
  config = function()
    require('nvim-tree').setup {}
    local api = require('nvim-tree.api')
    vim.keymap.set("n", "<leader>e", api.tree.toggle, opts)
  end
}
