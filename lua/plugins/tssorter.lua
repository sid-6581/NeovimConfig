return {
  "mtrajano/tssorter.nvim",
  event = "VeryLazy",

  keys = {
    { "<leader>cS", function() require("tssorter").sort() end, desc = "Sort [tssorter]" },
  },

  opts = {},
}
