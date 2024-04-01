---@diagnostic disable: missing-fields

local M = {}

function M.on_attach(_client, _bufnr) end

function M.setup(options)
  require("neoconf").setup({})
  require("neodev").setup({})
  require("mason").setup()
  require("mason-lspconfig").setup()

  local lspconfig = require("lspconfig")

  local setup = function(server_name, opts)
    lspconfig[server_name].setup(vim.tbl_deep_extend("force", {
      on_attach = options.on_attach,
      capabilities = options.capabilities,
    }, opts))
  end

  setup("rust_analyzer", {
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          features = "all",
          buildScripts = {
            useRustcWrapper = false,
          },
        },
        diagnostics = {
          disabled = { "unresolved-proc-macro" },
          experimental = {
            enable = true,
          },
        },
        check = {
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        files = {
          watcher = "server",
        },
      },
    },
  })

  setup("volar", {
    cmd = { "pnpm", "vue-language-server", "--stdio" },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    init_options = {
      vue = {
        hybridMode = true,
      },
    },
  })

  require("mason-lspconfig").setup_handlers({
    function(server_name) setup(server_name, {}) end,

    eslint = function(server_name)
      setup(server_name, {
        on_attach = function(_client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
    end,

    jsonls = function(server_name)
      setup(server_name, {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })
    end,

    omnisharp = function(server_name)
      setup(server_name, {
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

    powershell_es = function(server_name)
      setup(server_name, {
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

    pyright = function(server_name)
      setup(server_name, {
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

    lua_ls = function(server_name)
      setup(server_name, {
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

    tsserver = function(server_name)
      setup(server_name, {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "",
              languages = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            },
          },
        },
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      })
    end,

    yamlls = function(server_name)
      setup(server_name, {
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
end

return M
