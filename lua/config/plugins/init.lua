return {
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "kyazdani42/nvim-web-devicons",
  "b0o/schemastore.nvim",

  {
    "folke/which-key.nvim",
    dependencies = {
      "AndrewRadev/sideways.vim",
      "eandrju/cellular-automaton.nvim",
      "fedepujol/move.nvim",
      {
        "gbprod/substitute.nvim",
        config = true,
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
  },

  {
    "gpanders/editorconfig.nvim",
    event = "BufReadPost",
  },

  {
    "isobit/vim-caddyfile",
    event = "BufReadPost",
  },

  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",

    dependencies = {
      {
        "junegunn/fzf",
        build = ":call fzf#install()",
      },
    },
  },

  {
    "mechatroner/rainbow_csv",
    event = "BufReadPost",
  },

  {
    "moll/vim-bbye",
    cmd = "Bdelete",
  },

  {
    "nmac427/guess-indent.nvim",
    config = true,
    event = "BufReadPost",
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",

    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
    },
  },
}
