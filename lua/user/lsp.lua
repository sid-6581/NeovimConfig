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

-- Set LSP info border.
require("lspconfig.ui.windows").default_options.border = "rounded"
vim.cmd("highlight link LspInfoBorder Normal")

-- Automatically detect ansible yaml files.
vim.cmd([[
  autocmd BufRead *.yaml,*.yml if search('hosts:\|tasks:', 'nw') | set ft=yaml.ansible | endif
]])

-- lua-dev needs to be setup before lspconfig.
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

  ["powershell_es"] = function()
    lspconfig.powershell_es.setup({
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,
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
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "strict",
          },
        },
      },
    })
  end,

  ["jsonls"] = function()
    lspconfig.jsonls.setup({
      on_attach = opts.on_attach,
      capabilities = opts.capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })
  end,
})

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    code_actions.eslint,
    code_actions.shellcheck,
    diagnostics.eslint,
    diagnostics.flake8,
    formatting.black,
    formatting.eslint,
    -- formatting.prettier,
    formatting.shellharden,
    formatting.stylua,
  },
})
