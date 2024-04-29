return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
    config = function()
      require('telescope').setup {
        extensions = {
          ["ui-select"] = {
            require('telescope.themes').get_dropdown {}
          },
          ["file_browser"] = {
            hijack_netrw = true,
            -- mappings = {
            --   ["i"] = {
            --     -- your custom insert mode mappings
            --   },
            --   ["n"] = {
            --     -- your custom normal mode mappings
            --   },
            -- }
          },
        },
        defaults = {
          file_ignore_patterns = {
            "node_modules"
          }
        }
      }

      require('telescope').load_extension('ui-select')
      require('telescope').load_extension('file_browser')

      local opts = { noremap = true, silent = true }

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>p', builtin.buffers, opts)
      vim.keymap.set("n", "<leader>f", builtin.find_files, opts)
      vim.keymap.set("n", "<leader>l", builtin.live_grep, opts)

      -- local fb_actions = require 'telescope.'.extensions.file_browser.actions
      vim.keymap.set("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", opts)
      vim.keymap.set("n", "<leader>h", ":Telescope file_browser<CR>", opts)
    end
  },
}
