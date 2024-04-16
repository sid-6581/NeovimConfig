return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",

  opts = function()
    local nls = require("null-ls")

    local formatting = nls.builtins.formatting
    local diagnostics = nls.builtins.diagnostics

    local nomadfmt = {
      method = nls.methods.FORMATTING,
      filetypes = { "hcl" },
      generator = nls.formatter({
        command = "nomad",
        args = { "fmt", "-" },
        to_stdin = true,
        runtime_condition = function(params)
          -- only target nomad hcl files
          return params.bufname:match("%.nomad") ~= nil
        end,
      }),
    }

    nls.register(nomadfmt)

    return {
      sources = {
        diagnostics.hadolint,
        diagnostics.yamllint,
        formatting.black.with({ extra_args = { "--preview" } }),
        formatting.isort,
        formatting.packer,
        formatting.shellharden,
        formatting.stylua,
        formatting.yamlfmt,
      },
    }
  end,
}
