local M = {}

function M.on_attach(_client, buffer)
  local map = function(mode, lhs, rhs, opts)
    vim.tbl_deep_extend("force", { buffer = buffer, silent = true, noremap = true }, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  map("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
  map("n", "<Leader>cf", require("plugins.lsp.formatting").format, { desc = "Format document" })
  map("n", "<Leader>cF", require("plugins.lsp.formatting").toggle, { desc = "Toggle format on save" })
  map("n", "<Leader>cl", vim.lsp.codelens.run, { desc = "Codelens action" })
  map("n", "<Leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
  map("n", "K", vim.lsp.buf.hover, { desc = "Show information" })
  map("v", "<Leader>cf", require("plugins.lsp.formatting").format, { desc = "Format range" })
  map({ "n", "i" }, "<A-Enter>", vim.lsp.buf.code_action, { desc = "Code action" })

  -- LSP lines
  map("n", "<Leader>lL", require("lsp_lines").toggle, { desc = "Show LSP lines" })

  -- Telescope
  map("n", "<Leader>ld", "<CMD>Telescope diagnostics bufnr=0<CR>", { desc = "Document diagnostics" })
  map("n", "<Leader>lD", "<CMD>Telescope diagnostics<CR>", { desc = "Workspace diagnostics" })
  map("n", "<Leader>lr", "<CMD>Telescope lsp_references<CR>", { desc = "References" })
  map("n", "<Leader>ls", "<CMD>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
  map("n", "<Leader>lS", "<CMD>Telescopet lsp_dynamic_workspace_symbols<CR>", { desc = "Workspace symbols" })

  -- Goto-preview
  map("n", "gpd", function() require("goto-preview").goto_preview_definition({}) end, { desc = "Preview definition" })
  map(
    "n",
    "gpt",
    function() require("goto-preview").goto_preview_type_definition({}) end,
    { desc = "Preview type definition" }
  )
  map(
    "n",
    "gpi",
    function() require("goto-preview").goto_preview_implementation({}) end,
    { desc = "Preview implementation" }
  )
  map("n", "gP", function() require("goto-preview").close_all_win() end, { desc = "Close all preview windows" })
  map("n", "gpr", function() require("goto-preview").goto_preview_references() end, { desc = "Preview references" })

  -- Trouble
  map("n", "<Leader>xx", "<CMD>TroubleToggle<CR>", { desc = "Toggle trouble" })
  map("n", "<Leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>", { desc = "Toggle workspace diagnostics" })
  map("n", "<Leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>", { desc = "Toggle document diagnostics" })
  map("n", "<Leader>xl", "<CMD>TroubleToggle loclist<CR>", { desc = "Toggle loc list" })
  map("n", "<Leader>xq", "<CMD>TroubleToggle quickfix<CR>", { desc = "Toggle quickfix" })
  map("n", "gR", "<CMD>TroubleToggle lsp_references<CR>", { desc = "Toggle references" })

  map("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Go to previous diagnostic" })
  map("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Go to next diagnostic" })
  map("n", "gK", function() vim.lsp.buf.signature_help() end, { desc = "Signature Help" })
  map("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
  map("n", "gl", function() vim.diagnostic.open_float() end, { desc = "Show diagnostics" })

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
end

return M
