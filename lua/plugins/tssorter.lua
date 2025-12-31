return {
  "mtrajano/tssorter.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>cS", function() require("tssorter").sort({}) end, desc = "Sort [tssorter]" },
  },

  opts = {
    sortables = {
      yaml = {
        keys = {
          node = "block_mapping_pair",
        },
      },
    },
  },
}
