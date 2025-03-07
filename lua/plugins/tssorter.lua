return {
  "mtrajano/tssorter.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>cS", function() require("tssorter").sort({}) end, desc = "Sort [tssorter]" },
  },

  opts = {
    sortables = {
      jsonc = {
        keys = {
          node = "pair",
        },
      },
    },
  },
}
