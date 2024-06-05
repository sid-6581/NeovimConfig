return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufReadPre" },

  keys = {
    { "cc", mode = { "o", "x" }, desc = "Code chunk" },
  },

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
