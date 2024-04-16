return {
  "neovim/nvim-lspconfig",
  event = { "VeryLazy", "BufReadPre", "BufNewFile" },
  cmd = { "MasonToolsUpdate" },

  keys = {
    { "<Leader>lI", "<CMD>LspInfo<CR>", desc = "LSP info" },
  },

  dependencies = {
    {
      "williamboman/mason.nvim",

      keys = {
        { "<Leader>M", "<CMD>Mason<CR>", desc = "LSP installer info" },
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
    "b0o/schemastore.nvim",

    {
      "folke/neoconf.nvim",
      config = false,
    },

    {
      "folke/neodev.nvim",
      opts = {},
    },

    {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

      keys = {
        { "<Leader>uL", function() require("lsp_lines").toggle() end, desc = "Toggle LSP lines" },
      },

      config = function()
        require("lsp_lines").setup()
        vim.diagnostic.config({ virtual_lines = false }, require("lazy.core.config").ns)
        vim.diagnostic.config({ virtual_lines = false })
      end,
    },
  },

  config = function()
    require("neoconf").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup()

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then return end

        local map = function(mode, lhs, rhs, opts)
          vim.tbl_deep_extend("force", { buffer = bufnr, silent = true, noremap = true }, opts)
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- stylua: ignore start
        map("n", "<Leader>ca", function() vim.lsp.buf.code_action() end, { desc = "Code action" })
        map("n", "<Leader>cl", function() vim.lsp.codelens.run() end, { desc = "Codelens" })
        map("n", "<Leader>cr", function() vim.lsp.buf.rename() end, { desc = "Rename" })
        map("n", "<Leader>lci", function() require("telescope.builtin").lsp_incoming_calls() end, { desc = "Incoming calls" })
        map("n", "<Leader>lco", function() require("telescope.builtin").lsp_outgoing_calls() end, { desc = "Outgoing calls" })
        map("n", "<Leader>lC1", function() vim.notify(vim.inspect(vim.lsp.get_clients()[1])) end, { desc = "View LSP server 1 information" })
        map("n", "<Leader>lC2", function() vim.notify(vim.inspect(vim.lsp.get_clients()[2])) end, { desc = "View LSP server 2 information" })
        map("n", "<Leader>lC3", function() vim.notify(vim.inspect(vim.lsp.get_clients()[3])) end, { desc = "View LSP server 3 information" })
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
        map("n", "K", function() vim.lsp.buf.hover() end, { desc = "Show information" })
        map("n", "gK", function() vim.lsp.buf.signature_help() end, { desc = "Signature help" })
        map("n", "gd", function() require("telescope.builtin").lsp_definitions() end, { desc = "Go to definition" })
        map("n", "gl", function() vim.diagnostic.open_float({ focusable = true, focus = true }) end, { desc = "Show diagnostics" })
        map("v", "<Leader>cf", function() require("plugins.lsp.formatting").format() end, { desc = "Format range" })
        map({ "n", "i", "v" }, "<A-Enter>", function() vim.lsp.buf.code_action() end, { desc = "Code action" })
        -- stylua: ignore end

        -- Refresh codelens
        if client.supports_method("textDocument/codeLens") then
          vim.lsp.codelens.refresh()
          vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("LspCodeLensRefresh." .. bufnr .. "." .. client.name, {}),
            buffer = bufnr,
            callback = function() vim.lsp.codelens.refresh({ bufnr = 0 }) end,
          })
        end
      end,
    })

    require("plugins.lsp.diagnostics").setup()
    require("plugins.lsp.handlers").setup()

    -- stylua: ignore start
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
    require("lspconfig.ui.windows").default_options.border = "single"
    vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "LspReferenceText", {})
    -- stylua: ignore end
  end,
}
