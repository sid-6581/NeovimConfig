return {
  "Rentib/cliff.nvim",
  event = "VeryLazy",

  keys = {
    { "<S-A-j>", function() require("cliff").go_down() end, mode = { "n", "v", "o" } },
    { "<S-A-k>", function() require("cliff").go_up() end, mode = { "n", "v", "o" } },
  },
}
