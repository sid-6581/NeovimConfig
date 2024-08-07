return {
  "neovim/nvim-lspconfig",

  dependencies = {
    {
      "williamboman/mason.nvim",

      keys = {
        { "<Leader>M", "<CMD>Mason<CR>", desc = "External tools [mason]" },
      },

      opts = {
        ui = {
          border = "single",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
  },
}
