-- finds all instances of a string(first argument) and replaces them with another string(second argument)
function find_and_replace()
  local user_input = vim.fn.input("Enter a value: ")
  if user_input and user_input ~= "" then
    local current_word = vim.fn.expand("<cword>")
    local cursor_pos = vim.fn.getpos('.')
    local command = "%s/\\<" .. current_word .. "\\>/" .. user_input .. "/g"
    vim.cmd(command)
    vim.fn.setpos('.', cursor_pos)
  else
    print('No input provided')
  end
end

function open_terminal()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    local buffer_name = vim.fn.bufname(bufnr)
    if buffer_name ~= "" and string.match(buffer_name, "term://*") then
      vim.cmd("belowright split | startinsert | buffer " .. bufnr)
      return
    end
  end
  vim.cmd("belowright split | startinsert | te")
end
