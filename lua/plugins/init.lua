return {
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "nvim-tree/nvim-web-devicons",

  {
    "gpanders/editorconfig.nvim",
    event = { "BufReadPost", "InsertEnter" },
  },

  {
    "isobit/vim-caddyfile",
    event = { "BufReadPost", "InsertEnter" },
  },

  {
    "mechatroner/rainbow_csv",
    ft = "csv",
  },

  {
    "moll/vim-bbye",
    cmd = "Bdelete",
  },

  {
    "nmac427/guess-indent.nvim",
    event = "BufReadPost",
    config = true,
  },
}
