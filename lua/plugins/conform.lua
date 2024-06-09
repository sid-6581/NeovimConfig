return {
  "stevearc/conform.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>cf", function() require("conform").format() end, mode = { "n", "v" }, desc = "Format document" },
    {
      "<Leader>uf",
      function()
        vim.g.disable_autoformat = not vim.g.disable_autoformat
        vim.notify((vim.g.disable_autoformat and "Disabled" or "Enabled") .. " format on save (global)")
      end,
      desc = "Toggle format on save (global)",
    },
    {
      "<Leader>uF",
      function()
        vim.b.disable_autoformat = not vim.b.disable_autoformat
        vim.notify((vim.b.disable_autoformat and "Disabled" or "Enabled") .. " format on save (buffer)")
      end,
      desc = "Toggle format on save (buffer)",
    },
  },

  opts = {
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

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
