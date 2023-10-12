---@diagnostic disable: missing-fields

local M = {}

function M.on_attach(_client, _bufnr) end

function M.setup(options)
  require("neoconf").setup({})
  require("neodev").setup({})
  require("mason").setup()
  require("mason-lspconfig").setup()

  local setup = function(server_name, opts)
    require("lspconfig")[server_name].setup(vim.tbl_deep_extend("force", {
      on_attach = options.on_attach,
      capabilities = options.capabilities,
    }, opts))
  end

  require("mason-lspconfig").setup_handlers({
    function(server_name) setup(server_name, {}) end,

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

    rust_analyzer = function()
      local codelldb = require("mason-registry").get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      if vim.fn.has("win32") == 1 then codelldb_path = extension_path .. "adapter/codelldb.exe" end

      require("rust-tools").setup({
        tools = {
          inlay_hints = {
            auto = false,
            max_len_align = false,
            highlight = "GruvboxBg2",
          },
          hover_actions = {
            border = "single",
          },
        },
        dap = {
          adapter = {
            type = "server",
            port = "13000",
            host = "127.0.0.1",
            executable = {
              command = codelldb_path,
              args = { "--port", "13000" },
            },
          },
        },
        server = {
          cmd = { "rustup", "run", "nightly", "rust-analyzer" },
          capabilities = options.capabilities,
          on_attach = options.on_attach,
          settings = {
            ["rust-analyzer"] = {
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
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },
      })
    end,

    taplo = function(server_name)
      local function show_documentation()
        if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
          require("crates").show_popup()
        else
          vim.lsp.buf.hover()
        end
      end

      setup(server_name, {
        on_attach = function(client, bufnr)
          options.on_attach(client, bufnr)
          vim.keymap.set("n", "K", show_documentation, { buffer = bufnr, desc = "Show Crate Documentation" })
        end,
        root_dir = function(fname)
          return require("lspconfig.util").find_git_ancestor(fname)
            or require("lspconfig.util").root_pattern("Cargo.toml")(fname)
        end,
      })
    end,

    volar = function(server_name)
      setup(server_name, {
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
