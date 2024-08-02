return {
  "echasnovski/mini.bracketed",
  event = "VeryLazy",

  keys = {
    {
      "]e",
      function() require("mini.bracketed").diagnostic("forward", { severity = vim.diagnostic.severity.ERROR }) end,
      desc = "Error forward [mini.bracketed]",
    },
    {
      "[e",
      function() require("mini.bracketed").diagnostic("backward", { severity = vim.diagnostic.severity.ERROR }) end,
      desc = "Error backward [mini.bracketed]",
    },
  },

  opts = {
    comment = { suffix = "" },
    quickfix = { suffix = "" },
    treesitter = { suffix = "" },
    undo = { suffix = "" },
    yank = { suffix = "" },
  },
}
