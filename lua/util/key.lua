local M = {}

-- Deletes buffer keymaps matching a predicate.
--- @param pred fun(mapping: vim.api.keyset.keymap): boolean
M.delete_buffer_mappings = function(pred)
  for _, mode in ipairs({ "n", "x", "s", "o", "i", "l", "c", "t" }) do
    for _, m in ipairs(vim.api.nvim_buf_get_keymap(0, mode)) do
      if pred(m) then
        --- @diagnostic disable-next-line: undefined-field
        vim.api.nvim_buf_del_keymap(0, mode, m.lhs)
      end
    end
  end
end

return M
