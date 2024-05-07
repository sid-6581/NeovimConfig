return {
  "monaqa/dial.nvim",
  event = "VeryLazy",

  keys = {
    { "<C-A>", function() require("dial.map").manipulate("increment", "normal") end, desc = "Increment" },
    { "<C-X>", function() require("dial.map").manipulate("decrement", "normal") end, desc = "Decrement" },
    { "g<C-A>", function() require("dial.map").manipulate("increment", "gnormal") end, desc = "Increment" },
    { "g<C-X>", function() require("dial.map").manipulate("decrement", "gnormal") end, desc = "Decrement" },
    {
      mode = { "v" },
      "<C-A>",
      function() require("dial.map").manipulate("increment", "visual") end,
      desc = "Increment",
    },
    {
      mode = { "v" },
      "<C-X>",
      function() require("dial.map").manipulate("decrement", "visual") end,
      desc = "Decrement",
    },
    {
      mode = { "v" },
      "g<C-A>",
      function() require("dial.map").manipulate("increment", "gvisual") end,
      desc = "Increment",
    },
    {
      mode = { "v" },
      "g<C-X>",
      function() require("dial.map").manipulate("decrement", "gvisual") end,
      desc = "Decrement",
    },
  },
}
