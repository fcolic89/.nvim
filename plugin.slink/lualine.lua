vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim"
})

require('lualine').setup {
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = { 'searchcount' },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' }
  },
}
