return {
  "stevearc/overseer.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>oo", "<CMD>OverseerOpen<CR>", desc = "Overseer toggle" },
    { "<Leader>or", "<CMD>OverseerRun<CR>", desc = "Overseer run" },
  },

  opts = {
    form = {
      border = "single",
    },
    confirm = {
      border = "single",
    },
    task_win = {
      border = "single",
    },
    help_win = {
      border = "single",
    },
  },
}
