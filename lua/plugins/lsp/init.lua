return {
  "neovim/nvim-lspconfig",
  event = { "VeryLazy", "BufReadPre", "BufNewFile" },
  cmd = { "MasonToolsUpdate" },

  keys = {
    { "<Leader>lI", "<CMD>LspInfo<CR>", desc = "LSP info" },
  },

  dependencies = {
    {
      "williamboman/mason.nvim",

      keys = {
        { "<Leader>M", "<CMD>Mason<CR>", desc = "LSP installer info" },
      },

      opts = {
        ui = {
          border = "single",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },

    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "b0o/schemastore.nvim",
    "nvimtools/none-ls.nvim",

    {
      "folke/neoconf.nvim",
      config = false,
    },

    {
      "folke/neodev.nvim",
      config = false,
    },

    {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

      keys = {
        { "<Leader>uL", function() require("lsp_lines").toggle() end, desc = "Toggle LSP lines" },
      },

      config = function()
        require("lsp_lines").setup()
        vim.diagnostic.config({ virtual_lines = false }, require("lazy.core.config").ns)
        vim.diagnostic.config({ virtual_lines = false })
      end,
    },
  },

  config = function()
    local tools = {
      "ansible-language-server",
      "bash-language-server",
      "beautysh",
      "black",
      "clangd",
      "codelldb",
      "css-lsp",
      "dockerfile-language-server",
      "eslint-lsp",
      "flake8",
      "hadolint",
      "html-lsp",
      "isort",
      "json-lsp",
      "lemminx",
      "lua-language-server",
      "pyright",
      "shellcheck",
      "shellharden",
      "stylua",
      "taplo",
      -- "typescript-language-server",
      "vim-language-server",
      "yaml-language-server",
      "yamlfmt",
      "yamllint",
    }

    if vim.fn.has("win32") == 1 then
      table.insert(tools, "powershell-editor-services")
      table.insert(tools, "omnisharp")
    end

    require("mason-tool-installer").setup({
      ensure_installed = tools,
      auto_update = true,
      run_on_start = true,
      start_delay = 3000,
    })

    require("plugins.lsp.diagnostics").setup()

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    local options = {
      on_attach = function(client, bufnr)
        require("plugins.lsp.handlers").on_attach(client, bufnr)
        require("plugins.lsp.diagnostics").on_attach(client, bufnr)
        require("plugins.lsp.formatting").on_attach(client, bufnr)
        require("plugins.lsp.keymaps").on_attach(client, bufnr)
      end,
      capabilities = capabilities,
    }

    require("plugins.lsp.handlers").setup(options)
    require("plugins.lsp.null-ls").setup(options)
    require("lspconfig.ui.windows").default_options.border = "single"

    vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "LspReferenceText", {})
  end,
}
