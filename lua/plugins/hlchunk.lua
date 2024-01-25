return {
  "shellRaining/hlchunk.nvim",
  event = "VeryLazy",
  opts = {
    chunk = {
      notify = false,
    },
    line_num = {
      use_treesitter = true,
    },
    blank = {
      chars = {
        "⋅",
      },
    },
  },
}
