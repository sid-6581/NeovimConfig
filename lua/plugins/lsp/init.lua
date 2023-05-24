return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "simrat39/rust-tools.nvim",

    { "folke/neodev.nvim", opts = {} },

    {
      "nvimdev/lspsaga.nvim",

      opts = {
        request_timeout = 10000,
        ui = {
          winblend = 10,
        },
        preview = {
          lines_above = 0,
          lines_below = 0,
        },
        lightbulb = {
          virtual_text = false,
        },
        symbol_in_winbar = {
          separator = "  ",
        },
      },
    },

    {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

      config = function()
        require("lsp_lines").setup()
        vim.diagnostic.config({ virtual_lines = false }, require("lazy.core.config").ns)
        vim.diagnostic.config({ virtual_lines = false })
      end,
    },
  },

  config = function()
    require("plugins.lsp.diagnostics").setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    local options = {
      on_attach = function(client, bufnr)
        require("plugins.lsp.handlers").on_attach(client, bufnr)
        require("plugins.lsp.diagnostics").on_attach(client, bufnr)
        require("plugins.lsp.formatting").on_attach(client, bufnr)
        require("plugins.lsp.keymaps").on_attach(client, bufnr)
      end,
      capabilities = capabilities,
      flags = { debounce_text_changes = 150 },
    }

    require("plugins.lsp.handlers").setup(options)
    require("plugins.lsp.null-ls").setup(options)

    require("lspconfig.ui.windows").default_options.border = "single"
    vim.cmd([[
      highlight link LspInfoBorder Normal
    ]])

    -- Automatically detect ansible yaml files.
    vim.cmd([[
      autocmd BufNewFile,BufRead *.yaml,*.yml if search('hosts:\|tasks:', 'nw') | set ft=yaml.ansible | endif
    ]])
  end,
}
