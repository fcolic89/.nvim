return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      contrast = "soft" -- can be "hard", "soft" or an empty string
    }

    vim.o.background = 'dark' -- can be "light" or "dark"
    vim.cmd.colorscheme('gruvbox')
  end
}
