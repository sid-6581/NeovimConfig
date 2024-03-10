return {
  "Rentib/cliff.nvim",
  event = "VeryLazy",

  keys = {
    { "<S-A-j>", mode = { "n", "v", "o" }, function() require("cliff").go_down() end },
    { "<S-A-k>", mode = { "n", "v", "o" }, function() require("cliff").go_up() end },
  },
}
