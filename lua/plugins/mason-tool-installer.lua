return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "VeryLazy",

  cmd = { "MasonToolsUpdate" },

  opts = function()
    local tools = {
      "ansible-language-server",
      "bash-language-server",
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
      "shfmt",
      "shellcheck",
      "shellharden",
      "stylua",
      "taplo",
      "typescript-language-server",
      "vim-language-server",
      "yaml-language-server",
      "yamlfmt",
      "yamllint",
    }

    if vim.fn.has("win32") == 1 then
      table.insert(tools, "powershell-editor-services")
      table.insert(tools, "omnisharp")
    end

    return {
      ensure_installed = tools,
      auto_update = true,
      run_on_start = true,
      start_delay = 3000,
    }
  end,
}
