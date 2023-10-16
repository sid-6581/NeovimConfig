return {
  "monaqa/dial.nvim",
  event = "VeryLazy",

  keys = {
    { "<C-A>", function() require("dial.map").manipulate("increment", "normal") end },
    { "<C-X>", function() require("dial.map").manipulate("decrement", "normal") end },
    { "g<C-A>", function() require("dial.map").manipulate("increment", "gnormal") end },
    { "g<C-X>", function() require("dial.map").manipulate("decrement", "gnormal") end },
    { mode = { "v" }, "<C-A>", function() require("dial.map").manipulate("increment", "visual") end },
    { mode = { "v" }, "<C-X>", function() require("dial.map").manipulate("decrement", "visual") end },
    { mode = { "v" }, "g<C-A>", function() require("dial.map").manipulate("increment", "gvisual") end },
    { mode = { "v" }, "g<C-X>", function() require("dial.map").manipulate("decrement", "gvisual") end },
  },
}
