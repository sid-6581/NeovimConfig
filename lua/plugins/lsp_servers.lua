return {
  "neovim/nvim-lspconfig",

  opts = function()
    return {
      servers = {
        denols = {
          filetypes = {
            "deno:/status.md",
          },
        },

        eslint = {
          on_attach = function(client, _bufnr)
            client.server_capabilities.documentFormattingProvider = true
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
                keywordSnippet = "Disable",
              },
              diagnostics = {
                unusedLocalExclude = { "_*" },
                globals = { "vim", "require" },
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
                preloadFileSize = 2000,
              },
            },
          },
        },

        nushell = {},

        omnisharp = {
          cmd = { "omnisharp" },
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

        ["rust_analyzer"] = {
          cmd = { vim.fn.expand("~/.local/bin/rust-analyzer") },
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                features = "all",
                -- buildScripts = {
                --   useRustcWrapper = false,
                -- },
              },
              completion = {
                fullFunctionSignatures = {
                  enable = true,
                },
              },
              diagnostics = {
                disabled = {
                  "macro-error",
                  "proc-macro-disabled",
                  "proc-macros-disabled",
                  "unresolved-proc-macro",
                },
                experimental = {
                  enable = true,
                },
                styleLints = {
                  enable = true,
                },
              },
              procMacro = {
                ignored = {
                  ["tracing-attributes"] = {
                    "instrument",
                  },
                  ["async-trait"] = {
                    "async_trait",
                  },
                },
              },
              check = {
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              files = {
                watcher = "server",
              },
              hover = {
                actions = {
                  references = {
                    enable = true,
                  },
                },
              },
              rustfmt = {
                extraArgs = { "+nightly" },
              },
              inlayHints = {
                maxLength = 200,
                bindingModeHints = {
                  enable = false,
                },
                chainingHints = {
                  enable = true,
                },
                closingBraceHints = {
                  enable = true,
                  minLines = 0,
                },
                closureCaptureHints = {
                  enable = true,
                },
                closureReturnTypeHints = {
                  enable = "always",
                },
                closureStyle = "rust_analyzer",
                discriminantHints = {
                  enable = "never",
                },
                expressionAdjustmentHints = {
                  enable = "never",
                },
                genericParameterHints = {
                  const = {
                    enable = true,
                  },
                  lifetime = {
                    enable = true,
                  },
                  type = {
                    enable = true,
                  },
                },
                implicitDrops = {
                  enable = true,
                },
                lifetimeElisionHints = {
                  enable = "skip_trivial",
                  useParameterNames = true,
                },
                parameterHints = {
                  enable = true,
                },
                rangeExclusiveHints = {
                  enable = false,
                },
                reborrowHints = {
                  enable = "never",
                },
              },
            },
          },
        },

        ts_ls = {
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
