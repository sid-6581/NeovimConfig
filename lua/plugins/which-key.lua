return {
  "folke/which-key.nvim",

  dependencies = {
    "AndrewRadev/sideways.vim",

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
          opts = { labeled_modes = "nv" },
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

    {
      "mg979/vim-visual-multi",
      init = function()
        -- vim.g.VM_quit_after_leaving_insert_mode = 1
        vim.g.VM_show_warnings = 0
        vim.g.VM_silent_exit = 1
      end,
    },

    "michaeljsmith/vim-indent-object",

    {
      "rmagatti/goto-preview",
      config = true,
    },

    "tpope/vim-unimpaired",
    "vim-scripts/ReplaceWithRegister",

    {
      "Wansmer/treesj",
      opts = {
        use_default_keymaps = false,
        check_syntax_error = false,
      },
    },
  },

  config = function()
    require("which-key").setup({
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
    })
  end,
}
