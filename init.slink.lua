require("core.set")
require("core.functions")
require("core.mappings")

-- load custom lua files
local config_path = vim.fn.stdpath('config')
for file in io.popen("ls " .. config_path .. "/lua/custom/"):lines() do
	if file:sub(-4) == ".lua" then
		require("custom." .. file:sub(1, -5))
	end
end
