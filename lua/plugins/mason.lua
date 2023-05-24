return {
  "williamboman/mason.nvim",

  opts = function()
    local opts = {
      ui = {
        border = "single",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      ensure_installed = {
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
      },
    }

    if vim.fn.has("win32") == 1 then
      table.insert(opts.ensure_installed, "powershell-editor-services")
      table.insert(opts.ensure_installed, "omnisharp")
    end

    return opts
  end,

  ---@param opts MasonSettings | {ensure_installed: string[]}
  config = function(_, opts)
    require("mason").setup(opts)
    local registry = require("mason-registry")

    local function ensure_installed()
      for _, tool in ipairs(opts.ensure_installed) do
        local name, version
        if type(tool) == "table" then
          name = tool[1]
          version = tool.version
        else
          name = tool
        end
        local package = registry.get_package(name)
        if not package:is_installed() then package:install({ version = version }) end
      end
    end

    if registry.refresh then
      registry.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
}
