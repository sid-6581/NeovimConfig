return {
  "stevearc/conform.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>cf", function() require("conform").format() end, mode = { "n", "v" }, desc = "Format document [conform]" },
  },

  opts = {
    format_on_save = function(bufnr)
      if not require("util.format").autoformat_enabled(bufnr) then
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
