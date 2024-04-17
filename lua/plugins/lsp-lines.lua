return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>uL", function() require("lsp_lines").toggle() end, desc = "Toggle LSP lines" },
  },

  config = function()
    require("lsp_lines").setup()
    vim.diagnostic.config({ virtual_lines = false }, require("lazy.core.config").ns)
    vim.diagnostic.config({ virtual_lines = false })
  end,
}
