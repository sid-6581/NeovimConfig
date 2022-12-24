return {
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "kyazdani42/nvim-web-devicons",
  "AndrewRadev/sideways.vim",
  "b0o/schemastore.nvim",
  "christoomey/vim-sort-motion",
  "eandrju/cellular-automaton.nvim",
  "fedepujol/move.nvim",
  "folke/which-key.nvim",
  {
    "gbprod/substitute.nvim",
    config = function()
      require("substitute").setup({})
    end,
  },
  "gpanders/editorconfig.nvim",
  "isobit/vim-caddyfile",
  "jose-elias-alvarez/null-ls.nvim",
  { "junegunn/fzf", build = ":call fzf#install()" },
  "kevinhwang91/nvim-bqf",
  {
    "kosayoda/nvim-lightbulb",
    config = function()
      require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
    end,
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  "L3MON4D3/LuaSnip",
  "mechatroner/rainbow_csv",
  "mfussenegger/nvim-dap",
  "mg979/vim-visual-multi",
  "michaeljsmith/vim-indent-object",
  "moll/vim-bbye",
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({})
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({})
    end,
  },
  "tpope/vim-unimpaired",
  "vim-scripts/ReplaceWithRegister",
  {
    "Wansmer/treesj",
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
        check_syntax_error = false,
      })
    end,
  },
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  "williamboman/mason-lspconfig.nvim",
  "williamboman/mason.nvim",
}
