-- empty setup using defaults
return {
  'nvim-tree/nvim-tree.lua',
  dependecies = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
  config = function()
    vim.keymap.set("n", "<leader>nt", function()
      if not vim.g.NvimTreeSetup then
        require('nvim-tree').setup {}
      end
      require('nvim-tree.api').tree.toggle()
    end, {})
  end
}
