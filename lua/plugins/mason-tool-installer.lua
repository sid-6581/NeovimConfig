return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",

  cmd = { "MasonToolsUpdate", "MasonToolsUpdateSync" },

  opts = {
    ensure_installed = {
      "ansible-language-server",
      "bash-language-server",
      "clangd",
      "codelldb",
      "css-lsp",
      "dockerfile-language-server",
      "eslint-lsp",
      "hadolint",
      "html-lsp",
      "jinja-lsp",
      "json-lsp",
      "lemminx",
      "lua-language-server",
      "pyright",
      "ruff",
      "shellcheck",
      "shellharden",
      "shfmt",
      "sqlfluff",
      "stylua",
      "taplo",
      "typescript-language-server",
      "vim-language-server",
      "yaml-language-server",
      "yamlfmt",
      "yamllint",
      vim.fn.has("win32") == 1 and "omnisharp" or nil,
      vim.fn.has("win32") == 1 and "powershell-editor-services" or nil,
    },
    auto_update = true,
    run_on_start = true,
    start_delay = 0,
  },

  config = function(_, opts)
    require("mason-tool-installer").setup(opts)
    require("mason-tool-installer").run_on_start()
  end,
}
