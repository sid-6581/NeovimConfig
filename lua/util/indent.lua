local M = {}

-- Reformats a buffer by running indentexpr on it. Will not do anything if autoformat is disabled.
M.indent_buffer = function()
  local bufnr = vim.api.nvim_get_current_buf()

  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
    return
  end

  local win_view = vim.fn.winsaveview()
  vim.cmd.normal("gg=G")
  if win_view then vim.fn.winrestview(win_view) end
end

return M
