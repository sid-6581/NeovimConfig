local SymbolKind = vim.lsp.protocol.SymbolKind

return {
  "Wansmer/symbol-usage.nvim",
  event = "VeryLazy",
  opts = {
    kinds = {
      SymbolKind.Function,
      SymbolKind.Method,
      SymbolKind.Field,
      SymbolKind.Struct,
      SymbolKind.Class,
      SymbolKind.Interface,
    },
    vt_position = "end_of_line",
    request_pending_text = false,
  },
}
