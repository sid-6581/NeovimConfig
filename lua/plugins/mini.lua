return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",

  opts = {
    ai = {},
  },

  config = function(_, opts) require("mini.ai").setup(opts.ai) end,
}
