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
      duration = 0,
      delay = 0,
    },
    line_num = {
      enable = true,
      use_treesitter = true,
    },
    indent = {
      enable = true,
      exclude_filetypes = {
        fidget = true,
        dbout = true,
      },
    },
    blank = {
      enable = true,
      chars = { "⋅" },
    },
  },
}
