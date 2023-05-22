local M = {}

function M.on_attach(client, buffer)
  local capabilities = client.server_capabilities

  require("which-key").register({
    buffer = buffer,

    ["<Leader>"] = {
      l = {
        name = "LSP",
        a = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "Code action" },
        ["C1"] = { "<CMD>lua =vim.lsp.get_active_clients()[1]<CR>", "View LSP server 1 information" },
        ["C2"] = { "<CMD>lua =vim.lsp.get_active_clients()[2]<CR>", "View LSP server 2 information" },
        ["C3"] = { "<CMD>lua =vim.lsp.get_active_clients()[3]<CR>", "View LSP server 3 information" },
        d = { "<CMD>Telescope diagnostics bufnr=0<CR>", "Document diagnostics" },
        D = { "<CMD>Telescope diagnostics<CR>", "Workspace diagnostics" },
        f = {
          {
            require("plugins.lsp.formatting").format,
            "Format Document",
            cond = capabilities.documentFormatting,
          },
          {
            require("plugins.lsp.formatting").format,
            "Format Range",
            cond = capabilities.documentRangeFormatting,
            mode = "v",
          },
        },
        F = { require("plugins.lsp.formatting").toggle, "Toggle format on save" },
        l = { "<CMD>lua vim.lsp.codelens.run()<CR>", "Codelens action" },
        q = { "<CMD>lua vim.diagnostic.setloclist()<CR>", "Quickfix" },
        r = { "<CMD>lua vim.lsp.buf.rename()<CR>", "Rename" },
        R = { "<CMD>lua vim.lsp.buf.references()<CR>", "References" },
        s = { "<CMD>Telescope lsp_document_symbols<CR>", "Document symbols" },
        S = { "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace symbols" },
      },
    },

    ["gD"] = { "<CMD>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
    ["gd"] = { "<CMD>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
    ["K"] = { "<CMD>lua vim.lsp.buf.hover()<CR>", "Show information" },
    ["gi"] = { "<CMD>lua vim.lsp.buf.implementation()<CR>", "List all implementations" },
    ["gl"] = { "<CMD>lua vim.diagnostic.open_float()<CR>", "Show diagnostics" },
    ["[d"] = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Go to previous diagnostic" },
    ["]d"] = { "<CMD>lua vim.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
    ["<A-Enter>"] = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "Code action", mode = { "n", "i", "x" } },

    -- Goto-preview plugin
    ["ghd"] = { "<CMD>lua require('goto-preview').goto_preview_definition()<CR>", "Preview definition" },
    ["ght"] = { "<CMD>lua require('goto-preview').goto_preview_type_definition()<CR>", "Preview type definition" },
    ["ghi"] = { "<CMD>lua require('goto-preview').goto_preview_implementation()<CR>", "Preview implementation" },
    ["gH"] = { "<CMD>lua require('goto-preview').close_all_win()<CR>", "Close all preview windows" },
    ["ghr"] = { "<CMD>lua require('goto-preview').goto_preview_references()<CR>", "Preview references" },

    -- Trouble plugin
    ["<Leader>xx"] = { "<CMD>TroubleToggle<CR>", "Toggle trouble" },
    ["<Leader>xw"] = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "Toggle workspace diagnostics" },
    ["<Leader>xd"] = { "<CMD>TroubleToggle document_diagnostics<CR>", "Toggle document diagnostics" },
    ["<Leader>xl"] = { "<CMD>TroubleToggle loclist<CR>", "Toggle loc list" },
    ["<Leader>xq"] = { "<CMD>TroubleToggle quickfix<CR>", "Toggle quickfix" },
    ["gR"] = { "<CMD>TroubleToggle lsp_references<CR>", "Toggle references" },

    -- LSP lines plugin
    ["L"] = {
      function()
        require("lsp_lines").toggle()
      end,
      "Toggle LSP lines",
    },

    -- g = {
    --   name = "+goto",
    --   d = { "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
    --   r = { "<cmd>Telescope lsp_references<cr>", "References" },
    --   R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
    --   D = { "<cmd>Telescope lsp_declarations<CR>", "Goto Declaration" },
    --   I = { "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
    --   t = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
    -- },

    ["<S-C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", mode = { "n", "i" } },
  })
end

return M
