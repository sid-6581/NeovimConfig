return {
  "stevearc/conform.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>cf", function() require("conform").format() end, mode = { "n", "v" }, desc = "Format document [conform]" },
  },

  --- @type conform.setupOpts
  opts = {
    format_on_save = function(bufnr)
      if not require("util.format").autoformat_enabled(bufnr) then
        return
      end

      return { timeout_ms = 500, lsp_format = "fallback" }
    end,

    default_format_opts = {
      lsp_format = "fallback",
      timeout_ms = 500,
    },

    formatters_by_ft = {
      bash = { "shellharden" },
      hcl = { "packer_fmt" },
      lua = { "stylua", lsp_format = "prefer" },
      sh = { "shellharden" },
      yaml = { "yamlfmt" },
    },
  },
}
