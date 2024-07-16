return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  keys = {
    { mode = { "n", "v" }, "<S-F1>", "<CMD>WhichKey<CR>", desc = "Open [which-key]" },
  },

  opts = {
    preset = "helix",
    sort = { "order", "group", "alphanum", "mod", "lower", "icase" },
    win = {
      width = {
        max = 100,
      },
      height = {
        max = 0.95,
      },
      wo = {
        winblend = 0,
      },
    },
    icons = {
      separator = " ",
      group = "",
    },
    replace = {
      key = {
        function(lhs)
          local Util = require("which-key.util")
          local Config = require("which-key.config")
          local keys = Util.keys(lhs)
          local ret = vim.tbl_map(function(key)
            local inner = key:match("^<(.*)>$")
            if not inner then
              return key
            end

            if inner == "NL" then
              inner = "C-J"
            end

            local parts = vim.split(inner, "-", { plain = true })
            parts[1] = Config.icons.keys[parts[1]] or parts[1]
            if parts[2] and parts[3] then
              vim.print(key)
              vim.print(parts[2])
              parts[2] = Config.icons.keys[parts[2]] or parts[2]
            end

            return table.concat(parts, "")
          end, keys)
          return table.concat(ret, "")
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
