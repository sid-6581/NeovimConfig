return {
  "stevearc/conform.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>cf", function() require("conform").format() end, desc = "Format document" },
  },

  opts = {
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
      return { timeout_ms = 500, lsp_fallback = true }
    end,

    formatters_by_ft = {
      hcl = { "packer_fmt" },
      bash = { "shellharden" },
      sh = { "shellharden" },
      yaml = { "yamlfmt" },
    },
  },
}
