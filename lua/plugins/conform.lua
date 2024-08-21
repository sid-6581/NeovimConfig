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

    formatters = {
      mdformat = {
        prepend_args = { "--wrap", "100" },
      },
    },

    formatters_by_ft = {
      bash = { "shellharden" },
      hcl = { "packer_fmt" },
      lua = function(bufnr)
        return vim.api.nvim_buf_call(bufnr, function()
          return #vim.fs.find(
            { ".stylua.toml" },
            { limit = 1, type = "file", path = vim.fn.expand("%:p:h"), upward = true }
          ) > 0 and { "stylua" } or {}
        end)
      end,
      markdown = { "mdformat" },
      sh = { "shellharden" },
      sql = { "sqlfluff" },
      yaml = { "yamlfmt" },
    },
  },
}
