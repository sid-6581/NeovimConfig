return {
  "monaqa/dial.nvim",
  event = "VeryLazy",

  keys = {
    { "<C-A>", function() require("dial.map").manipulate("increment", "normal") end, desc = "Increment [dial]" },
    { "<C-X>", function() require("dial.map").manipulate("decrement", "normal") end, desc = "Decrement [dial]" },
    { "g<C-A>", function() require("dial.map").manipulate("increment", "gnormal") end, desc = "Increment [dial]" },
    { "g<C-X>", function() require("dial.map").manipulate("decrement", "gnormal") end, desc = "Decrement [dial]" },
    { "<C-A>", function() require("dial.map").manipulate("increment", "visual") end, mode = { "v" }, desc = "Increment [dial]" },
    { "<C-X>", function() require("dial.map").manipulate("decrement", "visual") end, mode = { "v" }, desc = "Decrement [dial]" },
    { "g<C-A>", function() require("dial.map").manipulate("increment", "gvisual") end, mode = { "x" }, desc = "Increment [dial]" },
    { "g<C-X>", function() require("dial.map").manipulate("decrement", "gvisual") end, mode = { "x" }, desc = "Decrement [dial]" },
  },
}
