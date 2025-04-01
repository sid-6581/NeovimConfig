return {
  "Wansmer/symbol-usage.nvim",
  event = "VeryLazy",

  opts = {
    kinds = {
      vim.lsp.protocol.SymbolKind.Function,
      vim.lsp.protocol.SymbolKind.Method,
      vim.lsp.protocol.SymbolKind.Field,
      vim.lsp.protocol.SymbolKind.Struct,
      vim.lsp.protocol.SymbolKind.Class,
      vim.lsp.protocol.SymbolKind.Interface,
    },
    disable = {
      filetypes = {
        "markdown",
        "terraform",
      },
    },
    vt_position = "end_of_line",
    request_pending_text = false,
  },
}
