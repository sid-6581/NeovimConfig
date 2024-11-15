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
    completion = {
      crates = {
        enabled = true,
        min_chars = 1,
      },
    },
  },
}
