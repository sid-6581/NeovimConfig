return {
  "monaqa/dial.nvim",
  event = "VeryLazy",

  keys = {
    { "<C-A>", function() require("dial.map").manipulate("increment", "normal") end, desc = "Increment" },
    { "<C-X>", function() require("dial.map").manipulate("decrement", "normal") end, desc = "Decrement" },
    { "g<C-A>", function() require("dial.map").manipulate("increment", "gnormal") end, desc = "Increment" },
    { "g<C-X>", function() require("dial.map").manipulate("decrement", "gnormal") end, desc = "Decrement" },
    { "<C-A>", function() require("dial.map").manipulate("increment", "visual") end, mode = { "v" }, desc = "Increment" },
    { "<C-X>", function() require("dial.map").manipulate("decrement", "visual") end, mode = { "v" }, desc = "Decrement" },
    { "g<C-A>", function() require("dial.map").manipulate("increment", "gvisual") end, mode = { "v" }, desc = "Increment" },
    { "g<C-X>", function() require("dial.map").manipulate("decrement", "gvisual") end, mode = { "v" }, desc = "Decrement" },
  },
}
