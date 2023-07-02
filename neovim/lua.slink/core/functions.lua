-- find and replace
-- finds all instances of a string(first argument) and replaces them with another string(second argument)
vim.api.nvim_create_user_command(
    'Far',
    function(opts)
	    local command = "%s/\\<"..opts.fargs[1].."\\>/"..opts.fargs[2].."/g"
	    vim.cmd(command)
    end,
    { nargs = "*" }
)
