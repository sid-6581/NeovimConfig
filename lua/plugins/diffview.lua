return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>gdv", "<CMD>DiffviewOpen<CR>", desc = "Diffview" },
    { "<Leader>gdh", "<CMD>DiffviewFileHistory %<CR>", desc = "Diffview file history" },
  },

  opts = {},
}
