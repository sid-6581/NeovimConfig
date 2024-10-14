local M = {}

-- Toggles global or buffer autoformat.
--- @param bufnr? integer: Buffer number to toggle autoformat for (0 for current buffer), or nil to toggle globally.
M.toggle_autoformat = function(bufnr)
  bufnr = bufnr == 0 and vim.api.nvim_get_current_buf() or bufnr
  if not bufnr then
    vim.g.disable_autoformat = not vim.g.disable_autoformat
    vim.notify((require("util.format").autoformat_enabled() and "Enabled" or "Disabled") .. " format on save (global)")
  else
    vim.b[bufnr].disable_autoformat = not vim.b[bufnr].disable_autoformat
    vim.notify((require("util.format").autoformat_enabled(bufnr) and "Enabled" or "Disabled") .. " format on save (buffer)")
  end
end

-- Checks if autoformatting is enabled.
--- @param bufnr? integer: Buffer number to check autoformat for (0 or nil for current buffer).
--- @return boolean: true if autoformatting is enabled
M.autoformat_enabled = function(bufnr)
  bufnr = (bufnr == nil or bufnr == 0) and vim.api.nvim_get_current_buf() or bufnr
  return not (vim.b[bufnr].disable_autoformat or vim.g.disable_autoformat)
end

-- Reformats the current buffer by running indentexpr on it. Will not do anything if autoformat is disabled.
M.indent_buffer = function()
  if not M.autoformat_enabled(0) then
    return
  end

  local win_view = vim.fn.winsaveview()
  vim.cmd("silent! undojoin | keepjumps normal! gg=G")
  if win_view then vim.fn.winrestview(win_view) end
end

return M
