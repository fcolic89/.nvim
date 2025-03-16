return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.comment').setup {
        options = {
          ignore_blank_line = true
        }
      }
      require('mini.pairs').setup {}
      require('mini.completion').setup {}
    end
  },
}
