return {
  "nvim-mini/mini.visits",
  event = "VeryLazy",

  keys = {
    {
      "<C-'>",
      function()
        local items = vim.tbl_map(
          function(path)
            local relative_path = vim.fn.fnamemodify(path, ":.")
            return {
              file = relative_path,
              text = relative_path,
            }
          end,
          require("mini.visits").list_paths()
        )

        require("snacks").picker.pick({
          items = items,
          format = "file",
          title = "Recent Files [mini.visits]",
        })
      end,
      desc = "Recent project files [mini.visits]",
    },
  },

  opts = {
    list = {
      filter = function(path)
        return (not vim.startswith(path.path, "/mnt")) and vim.fn.isdirectory(path.path) == 0
      end,
    },
  },
}
