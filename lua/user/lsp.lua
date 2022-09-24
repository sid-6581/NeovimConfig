local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

local mason_tool_installer_status_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not mason_tool_installer_status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

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

mason_tool_installer.setup({
  ensure_installed = {
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
    "stylua",
    "taplo",
    "vim-language-server",
    "yaml-language-server",
  },
  auto_update = true,
  run_on_start = true,
  start_delay = 3000,
})

local opts = {
  setup = require("user.lsp-handlers").setup,
  on_attach = require("user.lsp-handlers").on_attach,
  capabilities = require("user.lsp-handlers").capabilities,
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
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,

      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
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
  root_dir = function(fname)
    local root =
      require("lspconfig.util").root_pattern(unpack({ ".null-ls-root", "Makefile", ".git", ".stylua.toml" }))(fname)
    if root and root ~= vim.env.HOME then
      return root
    end
    return require("lspconfig.util").find_git_ancestor(fname)
  end,
  sources = {
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
    diagnostics.flake8,
  },
})
