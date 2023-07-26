return {
  "folke/which-key.nvim",
  lazy = true,

  dependencies = {
    "michaeljsmith/vim-indent-object",
    "tpope/vim-unimpaired",
    "vim-scripts/ReplaceWithRegister",

    { "kylechui/nvim-surround", opts = {} },
    { "numToStr/Comment.nvim", opts = {} },
    { "rmagatti/goto-preview", opts = {} },

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
    show_help = false,
    show_keys = false,
    triggers_blacklist = {
      i = { "j", "k" },
      v = { "j", "k" },
    },
    defaults = {
      ["g"] = { name = "+goto" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<Leader><tab>"] = { name = "+tabs" },
      ["<Leader>b"] = { name = "+buffer" },
      ["<Leader>c"] = { name = "+code" },
      ["<Leader>f"] = { name = "+find" },
      ["<Leader>g"] = { name = "+git" },
      ["<Leader>w"] = { name = "+windows" },
      ["<Leader>x"] = { name = "+diagnostics/quickfix" },
    },
  },

  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
