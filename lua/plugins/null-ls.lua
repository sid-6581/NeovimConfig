local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

function M.setup(options)
  local nls = require("null-ls")

  local code_actions = nls.builtins.code_actions
  local formatting = nls.builtins.formatting
  local diagnostics = nls.builtins.diagnostics

  nls.setup({
    on_attach = options.on_attach,

    sources = {
      code_actions.shellcheck,
      diagnostics.flake8,
      diagnostics.hadolint,
      diagnostics.yamllint,
      formatting.black.with({
        extra_args = { "--preview" },
      }),
      formatting.isort,
      formatting.ocdc,
      formatting.packer,
      formatting.shellharden,
      formatting.stylua,
      formatting.yamlfmt,
    },
  })
end

return M
