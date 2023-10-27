local M = {}

-- Close all folds with a given fold level. Does not close folds inside the fold recursively.
function M.close_folds_with_level(level)
  local win_view = vim.fn.winsaveview()
  local line_count = vim.api.nvim_buf_line_count(0)
  local line = 1
  while line <= line_count do
    if vim.fn.foldlevel(line) == level then
      vim.api.nvim_win_set_cursor(0, { line, 0 })
      vim.cmd("norm! zc")
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
    vim.cmd({ cmd = "TSTextobjectGotoNextStart", args = { textobject } })
    if vim.deep_equal(cursor, vim.api.nvim_win_get_cursor(0)) then break end
    vim.cmd("norm! zc")
  end
  if win_view then vim.fn.winrestview(win_view) end
end

-- Closes the window unless it's the only window remaining in the tab page.
-- If the buffer in the window is not shown in any other window, also close the buffer.
function M.close_window_or_buffer()
  local current_tab_has_multiple_windows = #vim.tbl_filter(function(window)
    local buffer = vim.api.nvim_win_get_buf(window)
    return vim.fn.buflisted(buffer) == 1
  end, vim.api.nvim_tabpage_list_wins(0)) > 1

  local current_buffer = vim.api.nvim_get_current_buf()
  local current_buffer_is_listed = vim.fn.buflisted(current_buffer) == 1

  local multiple_listed_buffers = #vim.tbl_filter(
    function(buffer) return vim.fn.buflisted(buffer) == 1 end,
    vim.api.nvim_list_bufs()
  ) > 1

  local current_buffer_is_in_multiple_windows = #vim.tbl_filter(
    function(window) return vim.api.nvim_win_get_buf(window) == current_buffer end,
    vim.api.nvim_list_wins()
  ) > 1

  local multiple_tabs = #vim.api.nvim_list_tabpages() > 1

  local should_close_window = current_tab_has_multiple_windows
    or not current_buffer_is_listed
    or multiple_tabs and not multiple_listed_buffers

  local should_delete_buffer = current_buffer_is_listed
    and multiple_listed_buffers
    and not current_buffer_is_in_multiple_windows

  if should_close_window then
    vim.api.nvim_win_close(0, false)
    if should_delete_buffer then vim.api.nvim_buf_delete(current_buffer, {}) end
  else
    require("close_buffers").delete({ type = "this" })
  end
end

---@param silent boolean?
---@param values? {[1]:any, [2]:any}
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
    vim.diagnostic.enable()
    vim.notify("Enabled diagnostics")
  else
    vim.diagnostic.disable()
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
