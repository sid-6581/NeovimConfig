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

    for ls_name, _ in pairs(vim.lsp._enabled_configs) do
      vim.lsp.enable(ls_name)
    end

    -- for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lsp")) do
    --   if file:match("%.lua$") and file ~= "global.lua" then
    --     local ls_name = file:gsub("%.lua$", "")
    --     vim.lsp.enable(ls_name)
    --   end
    -- end
  end,
}
