local M = {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VimEnter",
  cmd = { "MasonToolsUpdate", "MasonToolsInstall" },

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
  },
}

function M.config()
  local mason_tool_installer = require("mason-tool-installer")

  local tools = {
    "ansible-language-server",
    "bash-language-server",
    "beautysh",
    "black",
    "clangd",
    "css-lsp",
    "dockerfile-language-server",
    "eslint-lsp",
    "flake8",
    "isort",
    "hadolint",
    "html-lsp",
    "json-lsp",
    "lemminx",
    "lua-language-server",
    "pyright",
    "rust-analyzer",
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

  mason_tool_installer.setup({
    ensure_installed = tools,
    auto_update = true,
    run_on_start = true,
    start_delay = 3000,
  })

  local mason = require("mason")

  mason.setup({
    ui = {
      border = "single",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
    max_concurrent_installers = 10,
  })

  local mason_lspconfig = require("mason-lspconfig")

  mason_lspconfig.setup({})
end

return M
