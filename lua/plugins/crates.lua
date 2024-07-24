return {
  "Saecki/crates.nvim",
  event = "VeryLazy",

  opts = {
    lsp = {
      enabled = true,
      actions = true,
      completion = true,
      hover = true,
    },
    popup = {
      border = "single",
    },
  },
}
