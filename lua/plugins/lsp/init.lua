local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "InsertEnter" },

  dependencies = {
    "b0o/schemastore.nvim",
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

function M.config()
  require("mason")

  local lsp_handlers = require("plugins.lsp.handlers")

  local options = {
    setup = lsp_handlers.setup,
    on_attach = lsp_handlers.on_attach,
    capabilities = lsp_handlers.capabilities,
  }

  options.setup()

  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")

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
        single_file_support = true,
        settings = {
          Lua = {
            completion = {
              callSnippet = "Both",
              workspaceWord = true,
            },
            diagnostics = {
              -- enable = false,
              groupSeverity = {
                strong = "Warning",
                strict = "Warning",
              },
              groupFileStatus = {
                ["ambiguity"] = "Opened",
                ["await"] = "Opened",
                ["codestyle"] = "None",
                ["duplicate"] = "Opened",
                ["global"] = "Opened",
                ["luadoc"] = "Opened",
                ["redefined"] = "Opened",
                ["strict"] = "Opened",
                ["strong"] = "Opened",
                ["type-check"] = "Opened",
                ["unbalanced"] = "Opened",
                ["unused"] = "Opened",
              },
              unusedLocalExclude = { "_*" },
            },
            format = {
              enable = false,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
                continuation_indent_size = "2",
              },
            },
            telemetry = {
              enable = false,
            },
            workspace = {
              checkThirdParty = false,
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

  require("plugins.null-ls").setup(options)

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
  vim.cmd([[
      augroup LspFormat
        autocmd! *
        autocmd BufWritePre *.lua,*.py lua vim.lsp.buf.format()
        autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js,*.vue EslintFixAll
      augroup END
  ]])
end

return M
