return {
  "folke/which-key.nvim",
  lazy = true,

  dependencies = {
    "AndrewRadev/sideways.vim",
    "michaeljsmith/vim-indent-object",
    "tpope/vim-unimpaired",
    "vim-scripts/ReplaceWithRegister",

    { "booperlv/nvim-gomove", opts = {} },
    { "gbprod/substitute.nvim", opts = {} },
    { "kylechui/nvim-surround", opts = {} },
    { "numToStr/Comment.nvim", opts = {} },
    { "rmagatti/goto-preview", opts = {} },

    {
      "ggandor/leap.nvim",

      dependencies = {
        { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } },
        "ggandor/leap-ast.nvim",
      },

      config = function()
        local leap = require("leap")
        leap.opts.max_phase_one_targets = 0
        leap.opts.highlight_unlabeled_phase_one_targets = false
      end,
    },

    {
      "mg979/vim-visual-multi",
      init = function()
        vim.g.VM_show_warnings = 0
        vim.g.VM_silent_exit = 1
      end,
    },

    {
      "Wansmer/treesj",
      opts = {
        use_default_keymaps = false,
        check_syntax_error = false,
      },
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
      ["gz"] = { name = "+surround" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader><tab>"] = { name = "+tabs" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>c"] = { name = "+code" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>gh"] = { name = "+hunks" },
      ["<leader>q"] = { name = "+quit/session" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>w"] = { name = "+windows" },
      ["<leader>x"] = { name = "+diagnostics/quickfix" },
    },
  },

  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
