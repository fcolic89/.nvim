function open_current_buffer()
  buffer = vim.api.nvim_buf_get_name(0)
  MiniFiles.open(buffer)
end

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

      vim.keymap.set('n', "<leader>e", open_current_buffer, { silent = true })
    end
  },
}
