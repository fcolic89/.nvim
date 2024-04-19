return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
  config = function()
    require('telescope').setup {
      extensions = {
        ["ui-select"] = {
          require('telescope.themes').get_dropdown {}
        }
      },
      defaults = {
        file_ignore_patterns = {
          "node_modules"
        }
      }
    }

    require('telescope').load_extension('ui-select')

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>p', builtin.buffers, {})
    vim.keymap.set("n", "<leader>f", builtin.find_files, opts)
    vim.keymap.set("n", "<leader>l", builtin.live_grep, opts)
  end
}
