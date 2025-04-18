return {
  "neovim/nvim-lspconfig",
  event = { "VeryLazy", "BufReadPre", "BufNewFile" },

  keys = {
    { "<Leader>lI", "<CMD>LspInfo<CR>", desc = "LSP info [lsp]" },
  },

  dependencies = {
    "williamboman/mason.nvim",
    "folke/neoconf.nvim",
  },

  config = function(_, opts)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        require("which-key").add({
          buffer = bufnr,
          { "<Leader>ca", function() vim.lsp.buf.code_action() end, desc = "Code action [lsp]" },
          { "<Leader>cl", function() vim.lsp.codelens.run() end, desc = "Codelens [lsp]" },
          { "<Leader>cr", function() vim.lsp.buf.rename() end, desc = "Rename [lsp]" },
          { "<Leader>lC", function() show(vim.lsp.get_clients(), { title = "LSP clients" }) end, desc = "View LSP details [lsp]" },
          { "<Leader>lD", function() require("snacks").picker.lsp_declarations() end, desc = "LSP declarations [snacks]" },
          { "<Leader>lS", function() require("snacks").picker.lsp_workspace_symbols() end, desc = "LSP workspace symbols [snacks]" },
          { "<Leader>ld", function() require("snacks").picker.lsp_definitions() end, desc = "LSP definitions [snacks]" },
          { "<Leader>li", function() require("snacks").picker.lsp_implementations() end, desc = "LSP implementations [snacks]" },
          { "<Leader>lr", function() require("snacks").picker.lsp_references() end, nowait = true, desc = "LSP references [snacks]" },
          {
            "<Leader>lR",
            function()
              vim.lsp.stop_client(vim.lsp.get_clients())
              vim.schedule(function() vim.cmd.edit() end)
            end,
            desc = "Restart LSP servers [lsp]",
          },
          { "<Leader>ls", function() require("snacks").picker.lsp_symbols() end, desc = "LSP symbols [snacks]" },
          { "<Leader>lt", function() require("snacks").picker.lsp_type_definitions() end, desc = "LSP type definitions [snacks]" },
          { "K", function() vim.lsp.buf.hover() end, desc = "Show information [lsp]" },
          { "gK", function() vim.lsp.buf.signature_help() end, desc = "Signature help [lsp]" },
          { "gd", "<C-]>", desc = "Go to definition [lsp]" },
          { "gl", function() vim.diagnostic.open_float({ focusable = true, focus = true }) end, desc = "Show diagnostics [diagnostic]" },
          { "<A-Enter>", function() vim.lsp.buf.code_action() end, mode = { "n", "i", "v" }, desc = "Code action [lsp]" },
        })

        local augroup_suffix = bufnr .. "." .. client.name

        -- Refresh codelens
        if client:supports_method("textDocument/codeLens") then
          vim.lsp.codelens.refresh({ bufnr = bufnr })
          vim.api.nvim_create_autocmd(
            { "BufEnter", "InsertLeave" },
            {
              group = vim.api.nvim_create_augroup("LspCodeLensRefresh." .. augroup_suffix, {}),
              buffer = bufnr,
              callback = function()
                if vim.lsp.buf_is_attached(bufnr, client.id) then
                  vim.lsp.codelens.refresh({ bufnr = bufnr })
                end
              end,
            })
        end
      end,
    })

    -- Configure diagnostics
    local signs = {
      Error = "",
      Hint = "",
      Info = "",
      Warn = "",
    }

    vim.diagnostic.config({
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        border = "rounded",
        scope = "cursor",
        source = true,
        header = "",
        prefix = "",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error,
          [vim.diagnostic.severity.WARN] = signs.Warn,
          [vim.diagnostic.severity.HINT] = signs.Hint,
          [vim.diagnostic.severity.INFO] = signs.Info,
        },
      },
      virtual_text = { spacing = 4 },
    })

    -- Set up LSP servers
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    )

    local setup = function(server_name)
      local server_opts = vim.tbl_deep_extend(
        "force",
        { capabilities = vim.deepcopy(capabilities) },
        opts.servers[server_name] or {}
      )

      require("lspconfig")[server_name].setup(server_opts)
    end

    for name, _ in pairs(opts.servers) do
      setup(name)
    end

    -- Let Mason set up servers we haven't explicitly set up above.
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        if not opts.servers[server_name] then
          setup(server_name)
        end
      end,
    })
  end,

  opts = function()
    return {
      servers = {
        ["rust_analyzer"] = {
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
        },

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

        qmlls = {
          cmd = { "qmlls6" },
        },

        ruff = {},

        vtsls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "vue",
          },
          settings = {
            vtsls = {
              autoUseWorkspaceTsdk = true,
              tsserver = {
                globalPlugins = {
                  {
                    name = "@vue/typescript-plugin",
                    location = "",
                    languages = { "vue" },
                    configNamespace = "typescript",
                    enableForWorkspaceTypeScriptVersions = true,
                  },
                },
              },
            },
            typescript = {
              preferences = {
                importModuleSpecifier = "non-relative",
              },
            },
          },
        },

        volar = {
          cmd = { "pnpm", "vue-language-server", "--stdio" },
          settings = {
            emmet = {
              showExpandedAbbreviation = "never",
            },
          },
        },

        yamlls = {
          settings = {
            yaml = {
              schemaStore = { enable = false, url = "" },
              schemas = require("schemastore").yaml.schemas(),
            },
          },
        },
      },
    }
  end,
}
