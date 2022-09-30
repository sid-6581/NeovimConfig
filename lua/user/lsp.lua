local util = require("user.util")

local mason = util.safe_require("mason")
if not mason then return end

local mason_lspconfig = util.safe_require("mason-lspconfig")
if not mason_lspconfig then return end

local mason_tool_installer = util.safe_require("mason-tool-installer")
if not mason_tool_installer then return end

local lua_dev = util.safe_require("lua-dev")
if not lua_dev then return end

local lspconfig = util.safe_require("lspconfig")
if not lspconfig then return end

local null_ls = util.safe_require("null-ls")
if not null_ls then return end

require("lspconfig.ui.windows").default_options.border = "rounded"
vim.cmd("highlight link LspInfoBorder Normal")

lua_dev.setup({})

mason.setup({
  ui = {
    border = "single",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  max_concurrent_installers = 10,
})

mason_lspconfig.setup({})

local tools = {
  "ansible-language-server",
  "bash-language-server",
  "black",
  "clangd",
  "css-lsp",
  "flake8",
  "html-lsp",
  "json-lsp",
  "lemminx",
  "lua-language-server",
  "pyright",
  "rust-analyzer",
  "shellcheck",
  "shellharden",
  "stylua",
  "taplo",
  "vim-language-server",
  "yaml-language-server",
}

if vim.fn.has("win32") == 1 then
  table.insert(tools, "powershell-editor-services")
  table.insert(tools, "omnisharp")
end

mason_tool_installer.setup({
  ensure_installed = tools,
  auto_update = true,
  run_on_start = true,
  start_delay = 3000,
})

local lsp_handlers = require("user.lsp-handlers")

local opts = {
  setup = lsp_handlers.setup,
  on_attach = lsp_handlers.on_attach,
  capabilities = lsp_handlers.capabilities,
}

opts.setup()

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,
    })
  end,

  ["rust_analyzer"] = function()
    require("rust-tools").setup({})
  end,

  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup({
      settings = {
        Lua = {
          completion = {
            callSnippet = "Disable",
          },
        },
      },
    })
  end,

  ["pyright"] = function()
    lspconfig.pyright.setup({
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,

      settings = {
        python = {
          analysis = {
            -- Disable strict type checking
            typeCheckingMode = "off",
          },
        },
      },
    })
  end,

  ["jsonls"] = function()
    -- Find more schemas here: https://www.schemastore.org/json/
    -- Schemas for common json files
    local schemas = {
      {
        description = "TypeScript compiler configuration file",
        fileMatch = {
          "tsconfig.json",
          "tsconfig.*.json",
        },
        url = "https://json.schemastore.org/tsconfig.json",
      },
      {
        description = "Lerna config",
        fileMatch = { "lerna.json" },
        url = "https://json.schemastore.org/lerna.json",
      },
      {
        description = "Babel configuration",
        fileMatch = {
          ".babelrc.json",
          ".babelrc",
          "babel.config.json",
        },
        url = "https://json.schemastore.org/babelrc.json",
      },
      {
        description = "ESLint config",
        fileMatch = {
          ".eslintrc.json",
          ".eslintrc",
        },
        url = "https://json.schemastore.org/eslintrc.json",
      },
      {
        description = "Bucklescript config",
        fileMatch = { "bsconfig.json" },
        url = "https://raw.githubusercontent.com/rescript-lang/rescript-compiler/8.2.0/docs/docson/build-schema.json",
      },
      {
        description = "Prettier config",
        fileMatch = {
          ".prettierrc",
          ".prettierrc.json",
          "prettier.config.json",
        },
        url = "https://json.schemastore.org/prettierrc",
      },
      {
        description = "Vercel Now config",
        fileMatch = { "now.json" },
        url = "https://json.schemastore.org/now",
      },
      {
        description = "Stylelint config",
        fileMatch = {
          ".stylelintrc",
          ".stylelintrc.json",
          "stylelint.config.json",
        },
        url = "https://json.schemastore.org/stylelintrc",
      },
      {
        description = "A JSON schema for the ASP.NET LaunchSettings.json files",
        fileMatch = { "launchsettings.json" },
        url = "https://json.schemastore.org/launchsettings.json",
      },
      {
        description = "Schema for CMake Presets",
        fileMatch = {
          "CMakePresets.json",
          "CMakeUserPresets.json",
        },
        url = "https://raw.githubusercontent.com/Kitware/CMake/master/Help/manual/presets/schema.json",
      },
      {
        description = "Configuration file as an alternative for configuring your repository in the settings page.",
        fileMatch = {
          ".codeclimate.json",
        },
        url = "https://json.schemastore.org/codeclimate.json",
      },
      {
        description = "LLVM compilation database",
        fileMatch = {
          "compile_commands.json",
        },
        url = "https://json.schemastore.org/compile-commands.json",
      },
      {
        description = "Config file for Command Task Runner",
        fileMatch = {
          "commands.json",
        },
        url = "https://json.schemastore.org/commands.json",
      },
      {
        description = "AWS CloudFormation provides a common language for you to describe and provision all the infrastructure resources in your cloud environment.",
        fileMatch = {
          "*.cf.json",
          "cloudformation.json",
        },
        url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/cloudformation.schema.json",
      },
      {
        description = "The AWS Serverless Application Model (AWS SAM, previously known as Project Flourish) extends AWS CloudFormation to provide a simplified way of defining the Amazon API Gateway APIs, AWS Lambda functions, and Amazon DynamoDB tables needed by your serverless application.",
        fileMatch = {
          "serverless.template",
          "*.sam.json",
          "sam.json",
        },
        url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/sam.schema.json",
      },
      {
        description = "Json schema for properties json file for a GitHub Workflow template",
        fileMatch = {
          ".github/workflow-templates/**.properties.json",
        },
        url = "https://json.schemastore.org/github-workflow-template-properties.json",
      },
      {
        description = "golangci-lint configuration file",
        fileMatch = {
          ".golangci.toml",
          ".golangci.json",
        },
        url = "https://json.schemastore.org/golangci-lint.json",
      },
      {
        description = "JSON schema for the JSON Feed format",
        fileMatch = {
          "feed.json",
        },
        url = "https://json.schemastore.org/feed.json",
        versions = {
          ["1"] = "https://json.schemastore.org/feed-1.json",
          ["1.1"] = "https://json.schemastore.org/feed.json",
        },
      },
      {
        description = "Packer template JSON configuration",
        fileMatch = {
          "packer.json",
        },
        url = "https://json.schemastore.org/packer.json",
      },
      {
        description = "NPM configuration file",
        fileMatch = {
          "package.json",
        },
        url = "https://json.schemastore.org/package.json",
      },
      {
        description = "JSON schema for Visual Studio component configuration files",
        fileMatch = {
          "*.vsconfig",
        },
        url = "https://json.schemastore.org/vsconfig.json",
      },
      {
        description = "Resume json",
        fileMatch = { "resume.json" },
        url = "https://raw.githubusercontent.com/jsonresume/resume-schema/v1.0.0/schema.json",
      },
    }

    lspconfig.jsonls.setup({
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,

      settings = {
        json = {
          schemas = schemas,
        },
      },

      setup = {
        commands = {
          Format = {
            function()
              vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
            end,
          },
        },
      },
    })
  end,
})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.prettier,
    formatting.black,
    formatting.stylua,
    formatting.shellharden,
    diagnostics.flake8,
  },
})
