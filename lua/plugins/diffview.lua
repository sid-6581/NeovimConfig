return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>gd", "<CMD>DiffviewOpen<CR>", desc = "Diffview" },
    { "<Leader>gh", "<CMD>DiffviewFileHistory<CR>", desc = "File history" },
  },

  opts = {},
}
