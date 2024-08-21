return {
  "echasnovski/mini.visits",
  event = "VeryLazy",

  keys = {
    { "<Leader>fv", function() require("mini.visits").select_path() end, desc = "Visits [mini.visits]" },
    { "<A-'>", function() require("mini.visits").select_path() end, desc = "Visits [mini.visits]" },
  },

  opts = {
    list = {
      filter = function(path)
        return vim.fn.isdirectory(path.path) == 0
      end,
    },
  },
}
