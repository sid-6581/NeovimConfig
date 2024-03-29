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

  vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
    local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id, false)
    vim.diagnostic.reset(ns)
    return vim.NIL
  end

  for type, icon in pairs(M.signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

function M.on_attach(client, _buf)
  if client.supports_method("textDocument/documentHighlight") then
    vim.cmd([[
      augroup lsp_document_highlight
        autocmd CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end
  if client.supports_method("textDocument/codeLens") then
    vim.cmd([[
      augroup lsp_codelens_refresh
        autocmd! * <buffer>
        autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh({ bufnr = 0 })
      augroup END
    ]])
  end
end

return M
