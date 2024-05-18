return {
  "pwntester/octo.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>gog", "<CMD>Octo gist list<CR>", desc = "Gists" },
    { "<Leader>goi", "<CMD>Octo issue list<CR>", desc = "Issues" },
    { "<Leader>gop", "<CMD>Octo pr list<CR>", desc = "PRs" },
    { "<Leader>gor", "<CMD>Octo repo list<CR>", desc = "Repos" },
  },

  opts = {},
}
