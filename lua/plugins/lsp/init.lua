local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "InsertEnter" },

  dependencies = {
    "b0o/schemastore.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    {
      "folke/neodev.nvim",
      config = true,
    },
    {
      "kosayoda/nvim-lightbulb",
      config = {
        autocmd = { enabled = true },
      },
    },
  },
}

local function on_attach(client, bufnr)
  require("plugins.lsp.handlers").on_attach(client, bufnr)
  require("plugins.lsp.diagnostics").on_attach(client, bufnr)
  require("plugins.lsp.formatting").on_attach(client, bufnr)
  require("plugins.lsp.keys").on_attach(client, bufnr)
end

function M.config()
  require("mason")
  require("plugins.lsp.diagnostics").setup()

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
  }

  require("plugins.lsp.handlers").setup(options)
  require("plugins.lsp.null-ls").setup(options)

  -- Set LSP info border.
  require("lspconfig.ui.windows").default_options.border = "rounded"
  vim.cmd([[
    highlight link LspInfoBorder Normal
  ]])

  -- Automatically detect ansible yaml files.
  vim.cmd([[
    autocmd BufRead *.yaml,*.yml if search('hosts:\|tasks:', 'nw') | set ft=yaml.ansible | endif
  ]])

  -- Automatically format files on save.
  -- vim.cmd([[
  --     augroup LspFormat
  --       autocmd! *
  --       autocmd BufWritePre *.lua,*.py lua vim.lsp.buf.format()
  --       autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.vue EslintFixAll
  --     augroup END
  -- ]])
end

return M
