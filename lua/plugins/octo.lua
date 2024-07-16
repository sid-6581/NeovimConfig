return {
  "pwntester/octo.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>gog", "<CMD>Octo gist list<CR>", desc = "Gists [octo]" },
    { "<Leader>goi", "<CMD>Octo issue list<CR>", desc = "Issues [octo]" },
    { "<Leader>gop", "<CMD>Octo pr list<CR>", desc = "PRs [octo]" },
    { "<Leader>gor", "<CMD>Octo repo list<CR>", desc = "Repos [octo]" },
  },

  opts = {
    suppress_missing_scope = {
      projects_v2 = true,
    },
  },
}
