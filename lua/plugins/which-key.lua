return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  opts = {
    preset = "modern",
    sort = { "order", "group", "alphanum", "mod", "lower", "icase" },
    win = {
      wo = {
        winblend = 0,
      },
    },
    icons = {
      separator = " ",
    },
    spec = {
      { "<Leader>", group = "Leader" },
      { "<Leader><Tab>", group = "Tabs" },
      { "<Leader>b", group = "Buffers" },
      { "<Leader>c", group = "Code" },
      { "<Leader>d", group = "Debug" },
      { "<Leader>f", group = "Find" },
      { "<Leader>g", group = "Git" },
      { "<Leader>go", group = "Octo" },
      { "<Leader>l", group = "LSP" },
      { "<Leader>o", group = "Overseer" },
      { "<Leader>t", group = "Terminal" },
      { "<Leader>u", group = "UI/toggles" },
      { "<Leader>w", group = "Windows" },
      { "<Leader>x", group = "Diagnostics/quickfix" },
      { "[", group = "Prev" },
      { "]", group = "Next" },
      { "g", group = "Goto/operators" },
      { "gp", group = "Goto preview" },
      { "c", group = "Code", mode = { "o", "x" } },
    },
  },
}
