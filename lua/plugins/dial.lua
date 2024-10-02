return {
  "monaqa/dial.nvim",
  event = "VeryLazy",

  keys = {
    { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, desc = "Increment [dial]" },
    { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, desc = "Decrement [dial]" },
    { "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end, desc = "Increment [dial]" },
    { "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end, desc = "Decrement [dial]" },
    { "<C-a>", function() require("dial.map").manipulate("increment", "visual") end, mode = { "v" }, desc = "Increment [dial]" },
    { "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end, mode = { "v" }, desc = "Decrement [dial]" },
    { "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, mode = { "x" }, desc = "Increment [dial]" },
    { "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, mode = { "x" }, desc = "Decrement [dial]" },
  },
}
