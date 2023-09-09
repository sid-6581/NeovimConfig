local M = {}

function M.on_attach(client, _bufnr)
  if client.name == "omnisharp" then
    client.server_capabilities.semanticTokensProvider = {
      full = vim.empty_dict(),
      legend = {
        tokenModifiers = { "static_symbol" },
        tokenTypes = {
          "comment",
          "excluded_code",
          "identifier",
          "keyword",
          "keyword_control",
          "number",
          "operator",
          "operator_overloaded",
          "preprocessor_keyword",
          "string",
          "whitespace",
          "text",
          "static_symbol",
          "preprocessor_text",
          "punctuation",
          "string_verbatim",
          "string_escape_character",
          "class_name",
          "delegate_name",
          "enum_name",
          "interface_name",
          "module_name",
          "struct_name",
          "type_parameter_name",
          "field_name",
          "enum_member_name",
          "constant_name",
          "local_name",
          "parameter_name",
          "method_name",
          "extension_method_name",
          "property_name",
          "event_name",
          "namespace_name",
          "label_name",
          "xml_doc_comment_attribute_name",
          "xml_doc_comment_attribute_quotes",
          "xml_doc_comment_attribute_value",
          "xml_doc_comment_cdata_section",
          "xml_doc_comment_comment",
          "xml_doc_comment_delimiter",
          "xml_doc_comment_entity_reference",
          "xml_doc_comment_name",
          "xml_doc_comment_processing_instruction",
          "xml_doc_comment_text",
          "xml_literal_attribute_name",
          "xml_literal_attribute_quotes",
          "xml_literal_attribute_value",
          "xml_literal_cdata_section",
          "xml_literal_comment",
          "xml_literal_delimiter",
          "xml_literal_embedded_expression",
          "xml_literal_entity_reference",
          "xml_literal_name",
          "xml_literal_processing_instruction",
          "xml_literal_text",
          "regex_comment",
          "regex_character_class",
          "regex_anchor",
          "regex_quantifier",
          "regex_grouping",
          "regex_alternation",
          "regex_text",
          "regex_self_escaped_character",
          "regex_other_escape",
        },
      },
      range = true,
    }
  end
  if client.name == "eslint" then client.server_capabilities.documentFormattingProvider = true end
end

function M.setup(options)
  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")
  local util = require("lspconfig.util")

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

    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
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

    ["rust_analyzer"] = function()
      local mason_registry = require("mason-registry")
      local codelldb = mason_registry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      if vim.fn.has("win32") then codelldb_path = extension_path .. "adapter/codelldb.exe" end

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

    ["taplo"] = function()
      local function show_documentation()
        if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
          require("crates").show_popup()
        else
          vim.lsp.buf.hover()
        end
      end
      lspconfig.taplo.setup({
        on_attach = function(client, bufnr)
          options.on_attach(client, bufnr)
          vim.keymap.set("n", "K", show_documentation, { buffer = bufnr, desc = "Show Crate Documentation" })
        end,
        capabilities = options.capabilities,
        root_dir = function(fname) return util.find_git_ancestor(fname) or util.root_pattern("Cargo.toml")(fname) end,
      })
    end,

    ["volar"] = function()
      lspconfig.volar.setup({
        on_attach = options.on_attach,
        capabilities = options.capabilities,
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
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
end

return M
