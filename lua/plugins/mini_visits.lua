return {
  "echasnovski/mini.visits",
  event = "VeryLazy",

  keys = {
    { "<C-'>", function() require("mini.visits").select_path() end, desc = "Recent project files [mini.visits]" },
  },

  opts = {
    list = {
      filter = function(path)
        return vim.fn.isdirectory(path.path) == 0
      end,
    },
  },
}
