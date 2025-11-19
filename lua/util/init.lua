local M = {}

-- Closes all folds with a given fold level. Does not close folds inside the fold recursively.
function M.close_folds_with_level(level)
  local line_count = vim.api.nvim_buf_line_count(0)
  local line = 1

  while line <= line_count do
    if vim.fn.foldclosed(line) == -1 and vim.fn.foldlevel(line) == level then
      vim.cmd.foldclose({ range = { line } })
      local end_line = vim.fn.foldclosedend(line)
      line = end_line > 0 and (end_line + 1) or (line + 1)
    else
      line = line + 1
    end
  end
end

-- Closes all folds with a given treesitter textobject. Does not close folds inside the fold recursively.
function M.close_text_object_folds(textobject)
  local win_view = vim.fn.winsaveview()
  vim.api.nvim_win_set_cursor(0, { 1, 0 })
  while true do
    local cursor = vim.api.nvim_win_get_cursor(0)
    require("nvim-treesitter-textobjects.move").goto_next_start(textobject, "textobjects")

    if vim.deep_equal(cursor, vim.api.nvim_win_get_cursor(0)) then
      break
    end

    vim.cmd.normal({ "zc", bang = true })
  end

  if win_view then vim.fn.winrestview(win_view) end
end

return M
