vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.relativenumber = true
vim.opt.wildmode = {"longest","list"}
vim.opt.mouse = "a" 
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.ttyfast = true
vim.opt.confirm = true
vim.opt.showcmd = true
vim.opt.wrap = false

vim.cmd[[colorscheme tokyonight]]

vim.api.nvim_create_user_command(
    'Far',
    function(opts)
	    local command = "%s/\\<"..opts.fargs[1].."\\>/"..opts.fargs[2].."/g"
	    vim.cmd(command)
    end,
    { nargs = "*" }
)
