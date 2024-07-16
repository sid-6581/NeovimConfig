return {
  "stevearc/overseer.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>oo", "<CMD>OverseerToggle<CR>", desc = "Toggle [overseer]" },
    { "<Leader>or", "<CMD>OverseerRun<CR>", desc = "Run [overseer]" },
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
