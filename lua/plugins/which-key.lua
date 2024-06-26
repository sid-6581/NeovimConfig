return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  opts = {
    window = {
      border = "single", -- none, single, double, shadow
      winblend = 0,
    },
    icons = {
      group = "",
    },
    defaults = {
      ["g"] = { name = "Goto/operators" },
      ["gp"] = { name = "Goto preview" },
      ["]"] = { name = "Next" },
      ["["] = { name = "Prev" },
      ["<Leader><Tab>"] = { name = "Tabs" },
      ["<Leader>b"] = { name = "Buffers" },
      ["<Leader>c"] = { name = "Code" },
      ["<Leader>d"] = { name = "Debug" },
      ["<Leader>f"] = { name = "Find" },
      ["<Leader>l"] = { name = "LSP" },
      ["<Leader>g"] = { name = "Git" },
      ["<Leader>go"] = { name = "Octo" },
      ["<Leader>o"] = { name = "Overseer" },
      ["<Leader>t"] = { name = "Terminal" },
      ["<Leader>u"] = { name = "UI/toggles" },
      ["<Leader>w"] = { name = "Windows" },
      ["<Leader>x"] = { name = "Diagnostics/quickfix" },
      ["c"] = { name = "Code", mode = { "o", "x" } },
    },
  },

  config = function(_, opts)
    require("which-key").setup(opts)
    require("which-key").register(opts.defaults)
  end,
}
