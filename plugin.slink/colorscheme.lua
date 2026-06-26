vim.pack.add({
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/vague-theme/vague.nvim"
})

require("vague").setup()
vim.cmd.colorscheme('vague')
