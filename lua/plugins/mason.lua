return {
  "williamboman/mason.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>M", "<CMD>Mason<CR>", desc = "External tools [mason]" },
  },

  opts = {
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
