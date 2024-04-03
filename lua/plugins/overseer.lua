return {
  "stevearc/overseer.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>oo", "<CMD>OverseerOpen<CR>", desc = "Overseer Open" },
    { "<Leader>or", "<CMD>OverseerRun<CR>", desc = "Overseer Run" },
  },

  opts = {},
}
