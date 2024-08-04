local M = {}

-- Gets all buffers filtered by some predicate.
--- @param predicate? fun(winid: integer): boolean Predicate
--- @return integer[]: Table of filtered buffer numbers
function M.buffers(predicate)
  return vim.tbl_filter(
    predicate or function() return true end,
    vim.api.nvim_list_bufs()
  )
end

-- Calls a function on each buffer that matches a predicate.
--- @param predicate? fun(bufnr: integer): boolean Predicate
--- @param func fun(bufnr: integer) Function to run for window
function M.buffers_run(predicate, func)
  for _, bufnr in ipairs(M.buffers(predicate)) do
    func(bufnr)
  end
end

-- Gets the IDs of all windows filtered by some predicate.
--- @param predicate? fun(winid: integer): boolean Predicate
--- @return integer[]: Table of filtered window IDs
function M.windows(predicate)
  return vim.tbl_filter(
    predicate or function() return true end,
    vim.api.nvim_list_wins()
  )
end

-- Gets the IDs of all windows with a buffer.
--- @return integer[]: Table of windows with buffer
function M.windows_with_buffer(bufnr)
  return M.windows(
    function(winid)
      return vim.api.nvim_win_get_buf(winid) == bufnr
    end
  )
end

-- Calls a function on each window that matches a predicate.
--- @param predicate? fun(winid: integer): boolean Predicate
--- @param func fun(winid: integer) Function to run for window
function M.windows_run(predicate, func)
  for _, winid in ipairs(M.windows(predicate)) do
    func(winid)
  end
end

-- Gets the IDs of the windows in the current tab page filtered by some predicate.
--- @param predicate? fun(winid: integer): boolean Predicate
--- @return integer[]: Table of filtered window IDs
function M.tab_windows(predicate)
  return vim.tbl_filter(
    predicate or function() return true end,
    vim.api.nvim_tabpage_list_wins(0)
  )
end

-- Calls a function on each window in a tab page that matches a predicate.
--- @param predicate? fun(winid: integer): boolean Predicate
--- @param func fun(winid: integer) Function to run for window
function M.tab_windows_run(predicate, func)
  for _, winid in ipairs(M.tab_windows(predicate)) do
    func(winid)
  end
end

-- Checks if a buffer is a no name buffer.
--- @param bufnr? integer
--- @return boolean
function M.is_no_name(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local opts = { buf = bufnr }
  return vim.api.nvim_buf_is_loaded(bufnr)
    and vim.api.nvim_buf_get_name(bufnr) == ""
    and vim.api.nvim_get_option_value("buflisted", opts) == true
    and vim.api.nvim_get_option_value("modified", opts) == false
    and vim.api.nvim_get_option_value("buftype", opts) == ""
    and vim.api.nvim_get_option_value("filetype", opts) == ""
end

-- Checks if a buffer is a normal buffer.
--- @param bufnr? integer
--- @return boolean
function M.is_normal(bufnr)
  return vim.api.nvim_get_option_value("buftype", { buf = bufnr }) == ""
end

-- Checks if a window contains a normal buffer.
--- @param winid? integer
--- @return boolean
function M.has_normal_buffer(winid)
  return M.is_normal(vim.api.nvim_win_get_buf(winid or 0))
end

-- Checks if a window is a normal (non-floating) window.
--- @param winid? integer
--- @return boolean
function M.is_normal_window(winid)
  return vim.api.nvim_win_get_config(winid or 0).relative == ""
end

-- Smart buffer closing.
function M.close_window_or_buffer()
  -- If the windows doesn't have a normal buffer, we just close it.
  if not M.has_normal_buffer(0) then
    vim.cmd.quit()
    return
  end

  local bufnr = vim.api.nvim_get_current_buf()
  local windows_with_buffer = M.windows(
    function(winid)
      return vim.api.nvim_win_get_buf(winid) == bufnr
    end
  )

  -- If the buffer is open in any other window (even on other tab pages), we close the window.
  -- If we're closing the only window containing this buffer, we delete the buffer to remove
  -- it from the listed buffers. The window will be closed automatically.
  if #windows_with_buffer > 1 then
    vim.cmd.quit()
  else
    vim.cmd.bdelete()
  end

  -- If we are now left with a tab page with a single window containing a no name buffer, we close it.
  if #M.tab_windows(M.is_normal_window) == 1 and M.is_no_name() then
    vim.cmd.quit()
  end
end

return M
