vim.o.background = 'dark' -- can be "light" or "dark"

return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        contrast = "hard" -- can be "hard", "soft" or an empty string
      }

      -- vim.cmd.colorscheme('gruvbox')
    end
  },
  {
    'rose-pine/neovim',
    config = function()
      require('rose-pine').setup {
        styles = {
          transparency = false
        }
      }

      --vim.cmd.colorscheme('rose-pine')
    end
  },
  {
    'aktersnurra/no-clown-fiesta.nvim',
    config = function()
      require('no-clown-fiesta').setup {
        transparent = true
      }
      vim.cmd.colorscheme('no-clown-fiesta')
    end
  },
}
