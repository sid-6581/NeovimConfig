return {
  "folke/which-key.nvim",

  dependencies = {
    "AndrewRadev/sideways.vim",
    "eandrju/cellular-automaton.nvim",

    {
      "booperlv/nvim-gomove",
      config = true,
    },

    {
      "gbprod/substitute.nvim",
      config = true,
    },

    {
      "ggandor/leap.nvim",

      dependencies = {
        {
          "ggandor/flit.nvim",
          config = { labeled_modes = "nv" },
        },
        { "ggandor/leap-ast.nvim" },
      },

      config = function()
        local leap = require("leap")
        leap.opts.max_phase_one_targets = 0
        leap.opts.highlight_unlabeled_phase_one_targets = false
      end,
    },

    {
      "kylechui/nvim-surround",
      config = true,
    },

    {
      "numToStr/Comment.nvim",
      config = true,
    },

    "mg979/vim-visual-multi",
    "michaeljsmith/vim-indent-object",

    {
      "rmagatti/goto-preview",
      config = true,
    },

    "tpope/vim-unimpaired",
    "vim-scripts/ReplaceWithRegister",

    {
      "Wansmer/treesj",
      config = {
        use_default_keymaps = false,
        check_syntax_error = false,
      },
    },
  },
}
