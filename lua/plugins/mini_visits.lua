return {
  "echasnovski/mini.visits",
  event = "VeryLazy",

  dependencies = {
    "echasnovski/mini.pick",
  },

  keys = {
    { "<Leader>fv", function() require("mini.extra").pickers.visit_paths() end, desc = "Visits [mini.visits]" },
    { "<C-'>", function() require("mini.extra").pickers.visit_paths() end, desc = "Visits [mini.visits]" },
  },

  opts = {
    list = {
      filter = function(path)
        return vim.fn.isdirectory(path.path) == 0
      end,
    },
  },
}
