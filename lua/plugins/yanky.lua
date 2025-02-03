return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",

  keys = {
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text [yanky]" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n" }, desc = "Put yanked text after cursor [yanky]" },
    { "P", "<Plug>(YankyGPutBefore)", mode = { "n" }, desc = "Put yanked text before cursor [yanky]" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "x" }, desc = "Replace text with yanked [yanky]" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "x" }, desc = "Replace text with yanked [yanky]" },
    { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history [yanky]" },
    { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history [yanky]" },
    { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise) [yanky]" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise) [yanky]" },
    { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise) [yanky]" },
    { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise) [yanky]" },
  },

  opts = {
    ring = {
      sync_with_numbered_registers = false,
    },
    system_clipboard = {
      sync_with_ring = false,
    },
    highlight = {
      timer = 200,
    },
  },

  config = function(_, opts)
    require("yanky").setup(opts)
    vim.api.nvim_set_hl(0, "YankyPut", { link = "Visual" })
    vim.api.nvim_set_hl(0, "YankyYanked", { link = "Visual" })
  end,
}
