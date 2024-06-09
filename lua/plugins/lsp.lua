return {
  "neovim/nvim-lspconfig",
  event = { "VeryLazy", "BufReadPre", "BufNewFile" },

  keys = {
    { "<Leader>lI", "<CMD>LspInfo<CR>", desc = "LSP info" },
  },

  dependencies = {
    {
      "williamboman/mason.nvim",

      keys = {
        { "<Leader>M", "<CMD>Mason<CR>", desc = "Mason" },
      },

      opts = {
        ui = {
          border = "single",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },

    "williamboman/mason-lspconfig.nvim",

    {
      "folke/neoconf.nvim",
      config = false,
    },
  },

  config = function(_, opts)
    require("neoconf").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup()

    -- Visual settings
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
    require("lspconfig.ui.windows").default_options.border = "single"
    vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "LspReferenceText", {})

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then return end

        local map = function(mode, lhs, rhs, map_opts)
          map_opts = vim.tbl_deep_extend("force", { buffer = bufnr, silent = true }, map_opts)
          vim.keymap.set(mode, lhs, rhs, map_opts)
        end

        map("n", "<Leader>ca", function() vim.lsp.buf.code_action() end, { desc = "Code action" })
        map("n", "<Leader>cl", function() vim.lsp.codelens.run() end, { desc = "Codelens" })
        map("n", "<Leader>cr", function() vim.lsp.buf.rename() end, { desc = "Rename" })
        map("n", "<Leader>lci", function() require("telescope.builtin").lsp_incoming_calls() end, { desc = "Incoming calls" })
        map("n", "<Leader>lco", function() require("telescope.builtin").lsp_outgoing_calls() end, { desc = "Outgoing calls" })
        map("n", "<Leader>lC", "<CMD>0Verbose =vim.lsp.get_clients()<CR>", { desc = "View LSP details" })
        map("n", "<Leader>ld", function() require("telescope.builtin").diagnostics() end, { desc = "Workspace diagnostics" })
        map("n", "<Leader>lD", function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, { desc = "Document diagnostics" })
        map("n", "<Leader>li", function() require("telescope.builtin").lsp_implementations() end, { desc = "Implementations" })
        map("n", "<Leader>lr", function() require("telescope.builtin").lsp_references() end, { desc = "References" })
        map("n", "<Leader>lR", function()
          vim.lsp.stop_client(vim.lsp.get_clients())
          vim.schedule(function() vim.cmd.edit() end)
        end, { desc = "Restart LSP servers" })
        map("n", "<Leader>ls", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, { desc = "Workspace symbols" })
        map("n", "<Leader>lS", function() require("telescope.builtin").lsp_document_symbols() end, { desc = "Document symbols" })
        map("n", "<Leader>uh", function()
          local enabled = vim.lsp.inlay_hint.is_enabled({})
          vim.notify((enabled and "Disabled" or "Enabled") .. " inlay hints")
          vim.lsp.inlay_hint.enable(not enabled)
        end, { desc = "Toggle inlay hints" })
        map("n", "K", function() vim.lsp.buf.hover() end, { desc = "Show information" })
        map("n", "gK", function() vim.lsp.buf.signature_help() end, { desc = "Signature help" })
        map("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
        map("n", "gl", function() vim.diagnostic.open_float({ focusable = true, focus = true }) end, { desc = "Show diagnostics" })
        map({ "n", "i", "v" }, "<A-Enter>", function() vim.lsp.buf.code_action() end, { desc = "Code action" })

        -- Refresh codelens
        if client.supports_method("textDocument/codeLens") then
          vim.lsp.codelens.refresh({ bufnr = bufnr })
          vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("LspCodeLensRefresh." .. bufnr .. "." .. client.name, {}),
            buffer = bufnr,
            callback = function() vim.lsp.codelens.refresh({ bufnr = bufnr }) end,
          })
        end

        -- Document highlights
        if client.supports_method("textDocument/documentHighlight") then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = vim.api.nvim_create_augroup("LspDocumentHighlight." .. bufnr .. "." .. client.name, {}),
            buffer = bufnr,
            callback = function() vim.lsp.buf.document_highlight() end,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved" }, {
            group = vim.api.nvim_create_augroup("LspClearReferences." .. bufnr .. "." .. client.name, {}),
            buffer = bufnr,
            callback = function() vim.lsp.buf.clear_references() end,
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
      float = { scope = "cursor", border = "single", source = true, header = "", prefix = "" },
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
}
