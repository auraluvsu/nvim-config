vim.api.nvim_create_user_command('FormatSQL', function()
  -- Get the path to the SQL formatter binary installed by Mason
  local sql_formatter_path = vim.fn.stdpath('data') .. '/mason/bin/sql-formatter'

  -- Check if the SQL formatter is installed
  if vim.fn.executable(sql_formatter_path) == 0 then
    vim.notify('SQL formatter is not installed. Run :MasonInstall sql-formatter', vim.log.levels.ERROR)
    return
  end

  -- Save the current buffer content to a temporary file
  local tmpfile = os.tmpname()
  vim.cmd('w! ' .. tmpfile)

  -- Run the SQL formatter on the temporary file
  local formatted_output = vim.fn.system(sql_formatter_path .. ' ' .. tmpfile)

  -- Check if the formatter succeeded
  if vim.v.shell_error ~= 0 then
    vim.notify('Failed to format SQL: ' .. formatted_output, vim.log.levels.ERROR)
    return
  end

  -- Replace the buffer content with the formatted output
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(formatted_output, '\n'))

  -- Clean up the temporary file
  os.remove(tmpfile)

  vim.notify('SQL formatted successfully!', vim.log.levels.INFO)
end, {})
