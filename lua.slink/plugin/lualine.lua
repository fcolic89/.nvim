return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'gruvbox',
          disabled_filetypes = {
            'NvimTree'
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { 'buffers' },
          lualine_x = { 'searchcount' },
          lualine_y = { 'filetype' },
          lualine_z = { 'location' }
        },
      }
    end
  }
}
