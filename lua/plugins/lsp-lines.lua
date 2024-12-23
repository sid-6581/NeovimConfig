return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "VeryLazy",
  enabled = false,

  config = function()
    require("lsp_lines").setup()
    vim.diagnostic.config({ virtual_lines = false }, require("lazy.core.config").ns)
    vim.diagnostic.config({ virtual_lines = false })

    require("snacks").toggle({
      name = "LSP lines",
      get = function()
        return vim.diagnostic.config().virtual_lines
      end,
      set = function(state)
        vim.diagnostic.config({ virtual_lines = state })
      end,
    }):map("<Leader>uL")
  end,
}
