return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufReadPre" },

  opts = {
    chunk = {
      enable = true,
      notify = false,
      textobject = "cc",
    },
    line_num = {
      enable = true,
      use_treesitter = true,
    },
    indent = {
      enable = true,
    },
    blank = {
      enable = true,
      chars = { "⋅" },
    },
  },
}

