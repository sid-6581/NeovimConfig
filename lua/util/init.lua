local M = {}

-- Normalize a path. Will fix Windows paths.
--- @param path string
function M.normalize_path(path)
  if path:sub(2, 2) == ":" then
    path = vim.fs.normalize(path):gsub("^%l", string.upper)
  end

  path = path:gsub("\\", "/")
  return path
end

-- Clean oldfiles. Normalize paths, remove junk.
function M.clean_oldfiles()
  local oldfiles = {}

  for _, path in ipairs(vim.v.oldfiles) do
    oldfiles[#oldfiles + 1] = M.normalize_path(path)
  end

  vim.v.oldfiles = oldfiles
end

-- Close all folds with a given fold level. Does not close folds inside the fold recursively.
function M.close_folds_with_level(level)
  local win_view = vim.fn.winsaveview()
  local line_count = vim.api.nvim_buf_line_count(0)
  local line = 1

  while line <= line_count do
    if vim.fn.foldlevel(line) == level then
      vim.api.nvim_win_set_cursor(0, { line, 0 })
      vim.cmd.normal({ "zc", bang = true })
      local end_line = vim.fn.foldclosedend(line)
      line = end_line > 0 and (end_line + 1) or (line + 1)
    else
      line = line + 1
    end
  end

  if win_view then vim.fn.winrestview(win_view) end
end

-- Close all folds with a given treesitter textobject. Does not close folds inside the fold recursively.
function M.close_text_object_folds(textobject)
  local win_view = vim.fn.winsaveview()
  vim.api.nvim_win_set_cursor(0, { 1, 0 })
  while true do
    local cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd.TSTextobjectGotoNextStart(textobject)

    if vim.deep_equal(cursor, vim.api.nvim_win_get_cursor(0)) then
      break
    end

    vim.cmd.normal({ "zc", bang = true })
  end

  if win_view then vim.fn.winrestview(win_view) end
end

-- Deletes the buffer unless it's displayed in multiple windows.
-- If the window still exists after deleting the buffer, close the window if there are no other listed buffers.
function M.close_window_or_buffer()
  local buf_info = vim.fn.getbufinfo("%")[1]
  local win_info = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1]
  local current_buffer_is_in_multiple_windows = #buf_info.windows > 1
  local multiple_listed_buffers = #vim.fn.getbufinfo({ buflisted = 1 }) > 1
  local multiple_windows = #vim.fn.gettabinfo()

  if not current_buffer_is_in_multiple_windows then
    if multiple_listed_buffers and not multiple_windows then
      vim.cmd.bprevious()
    end

    vim.api.nvim_buf_delete(buf_info.bufnr, {})
  end

  if not multiple_listed_buffers and vim.api.nvim_win_is_valid(win_info.winid) then
    vim.cmd.quit()
  end
end

-- Toggle a built-in option
--- @param silent boolean?
--- @param values? {[1]:any, [2]:any}
function M.toggle(option, silent, values)
  if values then
    if vim.opt_local[option]:get() == values[1] then
      vim.opt_local[option] = values[2]
    else
      vim.opt_local[option] = values[1]
    end

    return vim.notify("Set " .. option .. " to " .. vim.opt_local[option]:get())
  end

  vim.opt_local[option] = not vim.opt_local[option]:get()

  if not silent then
    if vim.opt_local[option]:get() then
      vim.notify("Enabled " .. option)
    else
      vim.notify("Disabled " .. option)
    end
  end
end

M.diagnostics_enabled = true

function M.toggle_diagnostics()
  M.diagnostics_enabled = not M.diagnostics_enabled
  if M.diagnostics_enabled then
    vim.diagnostic.enable(true)
    vim.notify("Enabled diagnostics")
  else
    vim.diagnostic.enable(false)
    vim.notify("Disabled diagnostics")
  end
end

M.number_enabled = { number = true, relativenumber = true }

function M.toggle_number()
  if vim.opt_local.number:get() or vim.opt_local.relativenumber:get() then
    M.number_enabled = { number = vim.opt_local.number:get(), relativenumber = vim.opt_local.relativenumber:get() }
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.notify("Disabled line numbers")
  else
    vim.opt_local.number = M.number_enabled.number
    vim.opt_local.relativenumber = M.number_enabled.relativenumber
    vim.notify("Enabled line numbers")
  end
end

return M
