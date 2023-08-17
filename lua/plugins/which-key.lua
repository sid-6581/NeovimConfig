return {
  "folke/which-key.nvim",
  lazy = true,

  dependencies = {
    {
      "mg979/vim-visual-multi",
      init = function()
        vim.g.VM_show_warnings = 0
        vim.g.VM_silent_exit = 1
      end,
    },
  },

  opts = {
    plugins = {
      spelling = {
        enabled = true,
      },
    },
    popup_mappings = {
      scroll_down = "<C-j>",
      scroll_up = "<C-k>",
    },
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 1, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
      winblend = 10,
    },
    hidden = { "<silent>", "<CMD>", "<CMD>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
    show_keys = true,
    triggers_blacklist = {
      i = { "j", "k" },
      v = { "j", "k" },
    },
    defaults = {
      ["g"] = { name = "+Goto" },
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
