return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufReadPre" },

  opts = {
    chunk = {
      enable = true,
      notify = false,
      duration = 0,
      delay = 0,
    },
    line_num = {
      enable = true,
      use_treesitter = true,
    },
    indent = {
      enable = false,
      exclude_filetypes = {
        fidget = true,
        dbout = true,
        markdown = true,
      },
    },
    blank = {
      enable = false,
      chars = { "⋅" },
    },
  },
}
