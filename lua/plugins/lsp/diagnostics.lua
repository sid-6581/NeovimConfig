local M = {}

M.signs = {
  Error = "",
  Warn = "",
  Hint = "",
  Info = "",
}

function M.setup()
  vim.diagnostic.config({
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      scope = "cursor",
      focusable = false,
      style = "minimal",
      border = "single",
      source = true,
      header = "",
      prefix = "",
    },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = M.signs.Error,
        [vim.diagnostic.severity.WARN] = M.signs.Warn,
        [vim.diagnostic.severity.HINT] = M.signs.Hint,
        [vim.diagnostic.severity.INFO] = M.signs.Info,
      },
    },
    virtual_text = {
      spacing = 4,
      prefix = function(diagnostic)
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
          return M.signs.Error
        elseif diagnostic.severity == vim.diagnostic.severity.WARN then
          return M.signs.Warn
        elseif diagnostic.severity == vim.diagnostic.severity.INFO then
          return M.signs.Info
        else
          return M.signs.Hint
        end
      end,
    },
  })

  for type, icon in pairs(M.signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

return M
