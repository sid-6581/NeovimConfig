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
    replace = {
      key = {
        function(key)
          local inner = key:match("^<(.*)>$")
          if not inner then
            return key
          end

          local parts = vim.split(inner, "-", { plain = true })
          local config = require("which-key.config").options

          parts[1] = config.icons.keys[parts[1]] or parts[1]
          if parts[2] and parts[3] then
            parts[2] = config.icons.keys[parts[2]] or parts[2]
          end

          return table.concat(parts, "")
        end,
      },
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
