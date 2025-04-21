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
      require('mini.files').setup {}
      -- require('mini.completion').setup {}

      vim.keymap.set('n', "<leader>e", ":lua MiniFiles.open()<CR>", { silent = true })
    end
  },
}
