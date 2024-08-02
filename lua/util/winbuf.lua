local M = {}

-- Gets all buffers filtered by some predicate.
--- @param predicate? fun(winid: integer): boolean Predicate
--- @return integer[]: Table of filtered buffer numbers
function M.get_buffers(predicate)
  return vim.tbl_filter(
    predicate or function() return true end,
    vim.api.nvim_list_bufs()
  )
end

-- Calls a function on each buffer that matches a predicate.
--- @param predicate? fun(bufnr: integer): boolean Predicate
--- @param func fun(bufnr: integer) Function to run for window
function M.run_for_buffers(predicate, func)
  for _, bufnr in ipairs(M.get_buffers(predicate)) do
    func(bufnr)
  end
end

-- Gets the IDs of all windows filtered by some predicate.
--- @param predicate? fun(winid: integer): boolean Predicate
--- @return integer[]: Table of filtered window IDs
function M.get_windows(predicate)
  return vim.tbl_filter(
    predicate or function() return true end,
    vim.api.nvim_list_wins()
  )
end

-- Gets the IDs of all windows with a buffer.
--- @return integer[]: Table of windows with buffer
function M.get_windows_with_buffer(bufnr)
  return M.get_windows(
    function(winid)
      return vim.api.nvim_win_get_buf(winid) == bufnr
    end
  )
end

-- Calls a function on each window that matches a predicate.
--- @param predicate? fun(winid: integer): boolean Predicate
--- @param func fun(winid: integer) Function to run for window
function M.run_for_windows(predicate, func)
  for _, winid in ipairs(M.get_windows(predicate)) do
    func(winid)
  end
end

-- Gets the IDs of the windows in the current tab page filtered by some predicate.
--- @param predicate? fun(winid: integer): boolean Predicate
--- @return integer[]: Table of filtered window IDs
function M.get_tab_windows(predicate)
  return vim.tbl_filter(
    predicate or function() return true end,
    vim.api.nvim_tabpage_list_wins(0)
  )
end

-- Calls a function on each window in a tab page that matches a predicate.
--- @param predicate? fun(winid: integer): boolean Predicate
--- @param func fun(winid: integer) Function to run for window
function M.run_for_tab_windows(predicate, func)
  for _, winid in ipairs(M.get_tab_windows(predicate)) do
    func(winid)
  end
end

-- Checks if a buffer is a no name buffer.
--- @param bufnr? integer
--- @return boolean
function M.is_no_name_buffer(bufnr)
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
--- @param bufnr integer
--- @return boolean
function M.is_normal_buffer(bufnr)
  return vim.api.nvim_get_option_value("buftype", { buf = bufnr }) == ""
end

-- Checks if a window contains a normal buffer.
--- @param winid integer
--- @return boolean
function M.window_has_normal_buffer(winid)
  return M.is_normal_buffer(vim.api.nvim_win_get_buf(winid))
end

-- Smart buffer closing.
function M.close_window_or_buffer()
  local bufnr = vim.api.nvim_get_current_buf()

  if M.window_has_normal_buffer(0) then
    local windows_with_buffer = M.get_windows(
      function(winid)
        return vim.api.nvim_win_get_buf(winid) == bufnr
      end
    )

    if #windows_with_buffer > 1 then
      vim.cmd.quit()
    else
      vim.cmd.bdelete()
    end
  else
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
