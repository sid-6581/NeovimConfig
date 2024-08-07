return {
  "NeogitOrg/neogit",
  event = "VeryLazy",

  keys = {
    { "<Leader>N", "<CMD>Neogit<CR>", desc = "Git [neogit]" },
  },

  opts = {
    status = {
      recent_commit_count = 1000,
    },
    sections = {
      recent = {
        folded = false,
      },
    },
  },
}
