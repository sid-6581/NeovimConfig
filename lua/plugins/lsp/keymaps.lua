local M = {}

function M.on_attach(client, buffer)
  local map = function(mode, lhs, rhs, opts)
    opts.buffer = buffer
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  map("n", "<Leader>la", vim.lsp.buf.code_action, { desc = "Code action" })
  map(
    "n",
    "<Leader>lC1",
    function() print(vim.inspect(vim.lsp.get_active_clients()[1])) end,
    { desc = "View LSP server 1 information" }
  )
  map(
    "n",
    "<Leader>lC2",
    function() print(vim.inspect(vim.lsp.get_active_clients()[2])) end,
    { desc = "View LSP server 2 information" }
  )
  map(
    "n",
    "<Leader>lC3",
    function() print(vim.inspect(vim.lsp.get_active_clients()[3])) end,
    { desc = "View LSP server 3 information" }
  )
  map("n", "<Leader>ld", "<CMD>Telescope diagnostics bufnr=0<CR>", { desc = "Document diagnostics" })
  map("n", "<Leader>lD", "<CMD>Telescope diagnostics<CR>", { desc = "Workspace diagnostics" })
  map("n", "<Leader>lf", require("plugins.lsp.formatting").format, { desc = "Format Document" })
  map("v", "<Leader>lf", require("plugins.lsp.formatting").format, { desc = "Format Range" })
  map("n", "<Leader>lF", require("plugins.lsp.formatting").toggle, { desc = "Toggle format on save" })
  map("n", "<Leader>ll", vim.lsp.codelens.run, { desc = "Codelens action" })
  map("n", "<Leader>lq", vim.diagnostic.setloclist, { desc = "Quickfix" })
  map("n", "<Leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
  map("n", "<Leader>lR", vim.lsp.buf.references, { desc = "References" })
  map("n", "<Leader>ls", "<CMD>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
  map("n", "<Leader>lS", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "Workspace symbols" })

  map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
  map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
  map("n", "K", vim.lsp.buf.hover, { desc = "Show information" })
  map("n", "gi", vim.lsp.buf.implementation, { desc = "List all implementations" })
  map("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostics" })
  map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
  map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
  map({ "n", "i" }, "<A-Enter>", vim.lsp.buf.code_action, { desc = "Code action" })

  -- Goto-preview plugin
  map("n", "ghd", function() require("goto-preview").goto_preview_definition() end, { desc = "Preview definition" })
  map(
    "n",
    "ght",
    function() require("goto-preview").goto_preview_type_definition() end,
    { desc = "Preview type definition" }
  )
  map(
    "n",
    "ghi",
    function() require("goto-preview").goto_preview_implementation() end,
    { desc = "Preview implementation" }
  )
  map("n", "gH", function() require("goto-preview").close_all_win() end, { desc = "Close all preview windows" })
  map("n", "ghr", function() require("goto-preview").goto_preview_references() end, { desc = "Preview references" })

  -- Trouble plugin
  map("n", "<Leader>xx", "<CMD>TroubleToggle<CR>", { desc = "Toggle trouble" })
  map("n", "<Leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>", { desc = "Toggle workspace diagnostics" })
  map("n", "<Leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>", { desc = "Toggle document diagnostics" })
  map("n", "<Leader>xl", "<CMD>TroubleToggle loclist<CR>", { desc = "Toggle loc list" })
  map("n", "<Leader>xq", "<CMD>TroubleToggle quickfix<CR>", { desc = "Toggle quickfix" })
  map("n", "gR", "<CMD>TroubleToggle lsp_references<CR>", { desc = "Toggle references" })

  -- LSP lines plugin
  map("n", "<Leader>lL", function() require("lsp_lines").toggle() end, { desc = "Toggle LSP lines" })

  map("n", "<S-C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
end

return M
