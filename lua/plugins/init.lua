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
}
