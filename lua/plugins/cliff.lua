return {
  "Rentib/cliff.nvim",
  event = "VeryLazy",

  keys = {
    { "<S-A-j>", function() require("cliff").go_down() end, mode = { "n", "v", "o" }, desc = "Cliff down" },
    { "<S-A-k>", function() require("cliff").go_up() end, mode = { "n", "v", "o" }, "Cliff up" },
  },
}
