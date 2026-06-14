vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wildmode = { "full" }
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.ttyfast = true
vim.opt.confirm = true
vim.opt.showcmd = true
vim.opt.wrap = false
vim.opt.autoread = true
vim.opt.cmdheight = 0
vim.opt.termguicolors = true

vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
    severity = {
      min = vim.diagnostic.severity.ERROR
    }
  },
})
