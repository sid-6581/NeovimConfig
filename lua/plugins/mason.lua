return {
  "williamboman/mason.nvim",

  dependencies = {
    "williamboman/mason-lspconfig.nvim",

    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",

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
          "isort",
          "hadolint",
          "html-lsp",
          "json-lsp",
          "lemminx",
          { "lua-language-server", version = "3.6.19" },
          "pyright",
          { "rust-analyzer", version = "nightly" },
          "shellcheck",
          "shellharden",
          "stylua",
          "taplo",
          -- "typescript-language-server",
          "vim-language-server",
          "vue-language-server",
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
      end,
    },
  },

  config = function()
    require("mason").setup({
      ui = {
        border = "single",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({})
  end,
}
