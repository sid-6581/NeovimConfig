return {
  "williamboman/mason.nvim",
  lazy = false,

  keys = {
    { "<Leader>M", "<CMD>Mason<CR>", desc = "External tools [mason]" },
  },

  dependencies = {
    "neovim/nvim-lspconfig",
  },

  opts = {
    registries = {
      "github:mason-org/mason-registry",
      "github:Crashdummyy/mason-registry",
    },
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
