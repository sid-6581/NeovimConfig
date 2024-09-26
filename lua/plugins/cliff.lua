return {
  "Rentib/cliff.nvim",
  event = "VeryLazy",

  keys = {
    { "<A-J>", function() require("cliff").go_down() end, mode = { "n", "x", "o" }, desc = "Down [cliff]" },
    { "<A-K>", function() require("cliff").go_up() end, mode = { "n", "x", "o" }, desc = "Up [cliff]" },
  },
}
