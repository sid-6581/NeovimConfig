return {
  "mrcjkb/rustaceanvim",

  config = function()
    vim.g.rustaceanvim = {
      server = {
        default_settings = {
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

        load_vscode_settings = false,
      },

      tools = {
        float_win_config = {
          border = "single",
        },
      },
    }
  end,
}
