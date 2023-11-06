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
      ["gp"] = { name = "Goto Preview" },
      ["]"] = { name = "Next" },
      ["["] = { name = "Prev" },
      ["<Leader><tab>"] = { name = "Tabs" },
      ["<Leader>b"] = { name = "Buffers" },
      ["<Leader>c"] = { name = "Code" },
      ["<Leader>d"] = { name = "Debug" },
      ["<Leader>f"] = { name = "Find" },
      ["<Leader>l"] = { name = "LSP" },
      ["<Leader>g"] = { name = "Git" },
      ["<Leader>go"] = { name = "Octo" },
      ["<Leader>t"] = { name = "Terminal" },
      ["<Leader>u"] = { name = "Toggles" },
      ["<Leader>w"] = { name = "Windows" },
      ["<Leader>x"] = { name = "Diagnostics/Quickfix" },
    },
  },

  config = function(_, opts)
    require("which-key").setup(opts)
    require("which-key").register(opts.defaults)
  end,
}
