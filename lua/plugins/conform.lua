local default_opts = {
  timeout_ms = 500,
  lsp_format = "fallback",

  filter = function(client)
    if client.name == "volar" then
      return false
    end

    return true
  end,
}

return {
  "stevearc/conform.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>cf", function() require("conform").format() end, mode = { "n", "x" }, desc = "Format document [conform]" },
  },

  --- @type conform.setupOpts
  opts = {
    -- Run everything except eslint (which is too slow) before saving.
    format_on_save = function(bufnr)
      if not require("util.format").autoformat_enabled(bufnr) then
        return
      end

      local opts = vim.deepcopy(default_opts)
      opts.filter = function(client)
        if not default_opts.filter(client) then
          return false
        end

        if client.name == "eslint" then
          return false
        end

        return true
      end
      return opts
    end,

    -- Run only eslint after saving.
    format_after_save = function(bufnr)
      if not require("util.format").autoformat_enabled(bufnr) then
        return
      end

      local opts = vim.deepcopy(default_opts)
      opts.async = true
      opts.timeout_ms = nil

      opts.filter = function(client)
        if client.name ~= "eslint" then
          return false
        end

        return true
      end
      return opts
    end,

    default_format_opts = default_opts,

    formatters = {
      indent_buffer = {
        format = function(_self, _ctx, _lines, callback)
          require("util.format").indent_buffer()
          callback()
        end,
      },
    },

    formatters_by_ft = {
      bash = { "shellharden" },
      css = { "prettierd" },
      hcl = { "packer_fmt" },
      just = { "indent_buffer" },
      lua = function(bufnr)
        return vim.api.nvim_buf_call(bufnr, function()
          return #vim.fs.find(
            { ".stylua.toml" },
            {
              limit = 1,
              type = "file",
              path = vim.fn.expand("%:p:h"),
              upward = true,
            }
          ) > 0 and { "stylua" } or {}
        end)
      end,
      markdown = { "deno_fmt" },
      nu = { "indent_buffer" },
      sh = { "shellharden" },
      sql = { "sqlfluff" },
      yaml = { "yamlfmt" },
    },
  },
}
