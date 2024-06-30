return {
  "neovim/nvim-lspconfig",

  opts = function()
    return {
      servers = {
        eslint = {
          on_attach = function(_client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", { buffer = bufnr, command = "EslintFixAll" })
          end,
        },

        jsonls = {
          capabilities = {
            textDocument = {
              completion = {
                completionItem = {
                  snippetSupport = true,
                },
              },
            },
          },
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },

        lua_ls = {
          settings = {
            Lua = {
              completion = {
                workspaceWord = false,
                postfix = ".",
              },
              diagnostics = {
                unusedLocalExclude = { "_*" },
                globals = { "vim", "require" },
              },
              format = {
                enable = true,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },

        nushell = {
        },

        omnisharp = {
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
        },

        powershell_es = {
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
        },

        pyright = {
          settings = {
            pyright = {
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                typeCheckingMode = "basic",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },

        ruff = {},

        rust_analyzer = {
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
              rustfmt = {
                extraArgs = { "+nightly" },
              },
            },
          },
        },

        tsserver = {
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "",
                languages = { "vue" },
              },
            },
          },
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        },

        yamlls = {
          settings = {
            yaml = {
              schemaStore = { enable = false, url = "" },
              schemas = require("schemastore").yaml.schemas(),
            },
          },
        },

        volar = {
          cmd = { "pnpm", "vue-language-server", "--stdio" },
          init_options = {
            vue = {
              hybridMode = true,
            },
          },
        },
      },
    }
  end,
}
