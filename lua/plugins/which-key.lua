return {
  "folke/which-key.nvim",
  lazy = true,

  opts = {
    window = {
      border = "single", -- none, single, double, shadow
      winblend = 10,
    },
    defaults = {
      ["gp"] = { name = "+Goto Preview" },
      ["]"] = { name = "+Next" },
      ["["] = { name = "+Prev" },
      ["<Leader><tab>"] = { name = "+Tabs" },
      ["<Leader>b"] = { name = "+Buffers" },
      ["<Leader>c"] = { name = "+Code" },
      ["<Leader>d"] = { name = "+Debug" },
      ["<Leader>f"] = { name = "+Find" },
      ["<Leader>l"] = { name = "+LSP" },
      ["<Leader>g"] = { name = "+Git" },
      ["<Leader>t"] = { name = "+Terminal" },
      ["<Leader>u"] = { name = "+Toggles" },
      ["<Leader>w"] = { name = "+Windows" },
      ["<Leader>x"] = { name = "+Diagnostics/Quickfix" },
    },
  },

  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
