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

function toggle_diagnostics()
  local config = vim.diagnostic.config()
  local virtual_lines_config = {
    current_line = true,
    severity = {
      min = vim.diagnostic.severity.ERROR
    }
  }

  vim.diagnostic.config({
    virtual_text = not config.virtual_text,
    virtual_lines = not config.virtual_lines and virtual_lines_config or false
  })
end

function copy_file_path_to_clipboard()
  local path = vim.api.nvim_buf_get_name(0)
  vim.fn.setreg('+', path)
end
