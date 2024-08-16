local M = {}

-- Toggles global or buffer autoformat.
--- @param bufnr? integer: Buffer number to toggle autoformat for (0 for current buffer), or nil to toggle globally.
M.toggle_autoformat = function(bufnr)
  bufnr = bufnr == 0 and vim.api.nvim_get_current_buf() or bufnr
  if not bufnr then
    vim.g.disable_autoformat = not vim.g.disable_autoformat
  else
    vim.b[bufnr].disable_autoformat = not vim.b[bufnr].disable_autoformat
  end
end

-- Checks if autoformatting is enabled.
--- @param bufnr? integer: Buffer number to check autoformat for (0 for current buffer), or nil to check global setting.
--- @return boolean: true if autoformatting is enabled
M.autoformat_enabled = function(bufnr)
  bufnr = bufnr == 0 and vim.api.nvim_get_current_buf() or bufnr
  return bufnr and (not vim.b[bufnr].disable_autoformat) or (not vim.g.disable_autoformat)
end

-- Reformats the current buffer by running indentexpr on it. Will not do anything if autoformat is disabled.
M.indent_buffer = function()
  if not M.autoformat_enabled(0) then
    return
  end

  local win_view = vim.fn.winsaveview()
  vim.cmd("silent! undojoin | normal gg=G")
  if win_view then vim.fn.winrestview(win_view) end
end

return M
