return {
  "neovim/nvim-lspconfig",

  opts = function()
    return {
      servers = {
        eslint = {
          on_attach = function(_client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                  return
                end

                vim.cmd("EslintFixAll")
              end,
            })
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
          handlers = {
            ["workspace/applyEdit"] = function() return { applied = false } end,
          },
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
              workspace = {
                preloadFileSize = 2000,
              },
            },
          },
        },

        nushell = {
          on_attach = function(_client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                  return
                end

                vim.cmd.normal("mzgg=G`z")
              end,
            })
          end,
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
                  "unresolved-proc-macro",
                  "macro-error",
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
