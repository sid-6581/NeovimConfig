return {
  "stevearc/overseer.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>oo", "<CMD>OverseerToggle<CR>", desc = "Toggle [overseer]" },
    { "<Leader>or", "<CMD>OverseerRun<CR>", desc = "Run [overseer]" },
  },

  opts = {
  },
}
