return {
  "folke/trouble.nvim",
  event = "VeryLazy",

  opts = {
    use_diagnostic_signs = true,
    modes = {
      symbols = {
        win = { size = 30 },
      },
    },
  },

  keys = {
    { "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics (Trouble)" },
    { "<leader>xs", "<CMD>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)" },
    { "<leader>xl", "<CMD>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP definitions / references / ... (Trouble)" },
    { "<leader>xL", "<CMD>Trouble loclist toggle<CR>", desc = "Location list (Trouble)" },
    { "<leader>xQ", "<CMD>Trouble qflist toggle<CR>", desc = "Quickfix list (Trouble)" },
  },
}
