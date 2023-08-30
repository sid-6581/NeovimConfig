return {
  "neovim/nvim-lspconfig",
  event = { "VeryLazy", "BufReadPre", "BufNewFile" },

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "simrat39/rust-tools.nvim",

    {
      "folke/neodev.nvim",
      opts = {},
    },

    {
      "sid-6581/symbols-outline.nvim",

      opts = {
        preview_bg_highlight = "Normal",
        relative_width = false,
        width = 40,
      },
    },

    {
      "SmiteshP/nvim-navic",

      opts = {
        lsp = {
          auto_attach = true,
        },
        highlight = true,
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

    vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "LspReferenceText", {})
  end,
}
