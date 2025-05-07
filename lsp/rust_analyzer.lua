return {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        features = "all",
        -- buildScripts = {
        --   useRustcWrapper = false,
        -- },
      },
      completion = {
        callable = {
          snippets = "none",
        },
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
}
