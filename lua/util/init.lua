local M = {}

-- Close all folds with a given fold level. Does not close folds inside the fold recursively.
function M.close_folds_with_level(level)
  local winView = vim.fn.winsaveview()
  local lineCount = vim.api.nvim_buf_line_count(0)
  local lnum = 1
  while lnum <= lineCount do
    if vim.fn.foldlevel(lnum) == level then
      vim.api.nvim_win_set_cursor(0, { lnum, 0 })
      vim.cmd("norm! zc")
      local endLnum = vim.fn.foldclosedend(lnum)
      lnum = endLnum > 0 and (endLnum + 1) or (lnum + 1)
    else
      lnum = lnum + 1
    end
  end
  vim.fn.winrestview(winView)
end

-- Close all folds with a given treesitter textobject. Does not close folds inside the fold recursively.
function M.close_text_object_folds(textobject)
  local winView = vim.fn.winsaveview()
  vim.api.nvim_win_set_cursor(0, { 1, 0 })
  while true do
    local cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd({ cmd = "TSTextobjectGotoNextStart", args = { textobject } })
    if vim.deep_equal(cursor, vim.api.nvim_win_get_cursor(0)) then break end
    vim.cmd("norm! zc")
  end
  vim.fn.winrestview(winView)
end

-- Closes the window unless it's the only window remaining in the tab page.
-- If the buffer in the window is not shown in any other window, also close the buffer.
function M.close_window_or_buffer()
  local current_buffer = vim.api.nvim_get_current_buf()

  -- Get windows with valid buffers.
  local windows = vim.tbl_filter(function(window)
    local buffer = vim.api.nvim_win_get_buf(window)
    return vim.api.nvim_buf_is_valid(buffer) and vim.api.nvim_get_option_value("buflisted", { buf = buffer })
  end, vim.api.nvim_tabpage_list_wins(0))

  -- Get windows showing the current buffer.
  local buffer_windows = vim.tbl_filter(
    function(window) return vim.api.nvim_win_get_buf(window) == current_buffer end,
    vim.api.nvim_tabpage_list_wins(0)
  )

  if #buffer_windows > 1 then
    vim.api.nvim_win_close(0, false)
  elseif #windows > 1 then
    vim.api.nvim_buf_delete(current_buffer, {})
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
