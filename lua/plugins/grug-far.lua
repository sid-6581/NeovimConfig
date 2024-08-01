return {
  "MagicDuck/grug-far.nvim",
  event = "VeryLazy",

  keys = {
    { "<leader>G", function() require("grug-far").grug_far() end, desc = "Search/replace in files [grug-far]" },
  },

  opts = {
    folding = {
      foldcolumn = "0",
    },
  },
}
