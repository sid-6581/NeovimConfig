local M = {
  "neovim/nvim-lspconfig",
}

function M.config()
  require("neodev").setup({})

  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local mason_tool_installer = require("mason-tool-installer")
  local lspconfig = require("lspconfig")
  local null_ls = require("null-ls")

  -- Set LSP info border.
  require("lspconfig.ui.windows").default_options.border = "rounded"
  vim.cmd("highlight link LspInfoBorder Normal")

  -- Automatically detect ansible yaml files.
  vim.cmd([[
    autocmd BufRead *.yaml,*.yml if search('hosts:\|tasks:', 'nw') | set ft=yaml.ansible | endif
  ]])

  -- Automatically format files on save.
  vim.cmd([[
      augroup LspFormat
        autocmd! *
        autocmd BufWritePre *.lua,*.py lua vim.lsp.buf.format()
        autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.vue EslintFixAll
      augroup END
  ]])

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

  mason_lspconfig.setup({})

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
    "typescript-language-server",
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

  local lsp_handlers = require("config.plugins.lsp.handlers")

  local options = {
    setup = lsp_handlers.setup,
    on_attach = lsp_handlers.on_attach,
    capabilities = lsp_handlers.capabilities,
  }

  options.setup()

  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = options.on_attach,
        capabilities = options.capabilities,
      })
    end,

    ["jsonls"] = function()
      lspconfig.jsonls.setup({
        on_attach = options.on_attach,
        capabilities = options.capabilities,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })
    end,

    ["omnisharp"] = function()
      lspconfig.omnisharp.setup({
        on_attach = options.on_attach,
        capabilities = options.capabilities,
        enable_decompilation_support = true,
        enable_import_completion = true,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        settings = {
          csharp = {
            format = {
              enable = true,
            },
          },
          omnisharp = {
            enableDecompilationSupport = true,
            enabledEditorConfigSupport = true,
            enableImportCompletion = true,
            enableRoslynAnalyzers = true,
            organizeImportsOnFormat = true,
          },
        },
      })
    end,

    ["powershell_es"] = function()
      lspconfig.powershell_es.setup({
        on_attach = options.on_attach,
        capabilities = options.capabilities,
        settings = {
          powershell = {
            codeFormatting = {
              autoCorrectAliases = true,
              avoidSemicolonsAsLineTerminators = true,
              preset = "OTBS",
              trimWhitespaceAroundPipe = true,
              useConstantStrings = true,
              useCorrectCasing = true,
              whitespaceBetweenParameters = true,
            },
          },
        },
      })
    end,

    ["pyright"] = function()
      lspconfig.pyright.setup({
        on_attach = options.on_attach,
        capabilities = options.capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              useLibraryCodeForTypes = true,
            },
          },
        },
      })
    end,

    ["sumneko_lua"] = function()
      lspconfig.sumneko_lua.setup({
        on_attach = options.on_attach,
        capabilities = options.capabilities,
        settings = {
          Lua = {
            completion = {
              callSnippet = "Disable",
            },
            diagnostics = {
              globals = { "vim" },
            },
            runtime = {
              version = "LuaJIT",
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
    end,

    ["volar"] = function()
      lspconfig.volar.setup({
        on_attach = options.on_attach,
        capabilities = options.capabilities,
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
      })
    end,

    ["yamlls"] = function()
      lspconfig.yamlls.setup({
        on_attach = options.on_attach,
        capabilities = options.capabilities,
        settings = {
          yaml = {
            schemaStore = {
              url = "https://www.schemastore.org/api/json/catalog.json",
              enable = true,
            },
          },
        },
      })
    end,
  })

  local code_actions = null_ls.builtins.code_actions
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
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
