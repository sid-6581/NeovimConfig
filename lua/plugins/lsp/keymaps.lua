local M = {}

function M.on_attach(_client, buffer)
  local map = function(mode, lhs, rhs, opts)
    vim.tbl_deep_extend("force", { buffer = buffer, silent = true, noremap = true }, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- LSP saga plugin
  map("n", "<Leader>co", "<CMD>Lspsaga outline<CR>", { desc = "Toggle outline" })
  map("n", "[d", "<CMD>Lspsaga diagnostic_jump_prev<CR>", { desc = "Go to previous diagnostic" })
  map("n", "]d", "<CMD>Lspsaga diagnostic_jump_next<CR>", { desc = "Go to next diagnostic" })
  map("n", "gd", "<CMD>Lspsaga goto_definition<CR>", { desc = "Go to definition" })
  map("n", "gh", "<CMD>Lspsaga lsp_finder<CR>", { desc = "LSP finder" })
  map("n", "gl", "<CMD>Lspsaga show_line_diagnostics ++unfocus<CR>", { desc = "Show line diagnostics" })

  map("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
  map("n", "<Leader>cf", require("plugins.lsp.formatting").format, { desc = "Format document" })
  map("n", "<Leader>cF", require("plugins.lsp.formatting").toggle, { desc = "Toggle format on save" })
  map("n", "<Leader>cl", vim.lsp.codelens.run, { desc = "Codelens action" })
  map("n", "<Leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
  map("n", "K", vim.lsp.buf.hover, { desc = "Show information" })
  map("v", "<Leader>cf", require("plugins.lsp.formatting").format, { desc = "Format range" })
  map({ "n", "i" }, "<A-Enter>", vim.lsp.buf.code_action, { desc = "Code action" })

  -- LSP lines plugin
  map("n", "<Leader>lL", require("lsp_lines").toggle, { desc = "Show LSP lines" })

  map("n", "<Leader>ld", "<CMD>Telescope diagnostics bufnr=0<CR>", { desc = "Document diagnostics" })
  map("n", "<Leader>lD", "<CMD>Telescope diagnostics<CR>", { desc = "Workspace diagnostics" })
  map("n", "<Leader>lR", vim.lsp.buf.references, { desc = "References" })
  map("n", "<Leader>ls", "<CMD>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
  map("n", "<Leader>lS", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "Workspace symbols" })

  -- Goto-preview plugin
  -- map("n", "ghd", require("goto-preview").goto_preview_definition, { desc = "Preview definition" })
  -- map("n", "ght", require("goto-preview").goto_preview_type_definition, { desc = "Preview type definition" })
  -- map("n", "ghi", require("goto-preview").goto_preview_implementation, { desc = "Preview implementation" })
  -- map("n", "gH", require("goto-preview").close_all_win, { desc = "Close all preview windows" })
  -- map("n", "ghr", require("goto-preview").goto_preview_references, { desc = "Preview references" })

  -- Trouble plugin
  map("n", "<Leader>xx", "<CMD>TroubleToggle<CR>", { desc = "Toggle trouble" })
  map("n", "<Leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>", { desc = "Toggle workspace diagnostics" })
  map("n", "<Leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>", { desc = "Toggle document diagnostics" })
  map("n", "<Leader>xl", "<CMD>TroubleToggle loclist<CR>", { desc = "Toggle loc list" })
  map("n", "<Leader>xq", "<CMD>TroubleToggle quickfix<CR>", { desc = "Toggle quickfix" })
  map("n", "gR", "<CMD>TroubleToggle lsp_references<CR>", { desc = "Toggle references" })

  map("n", "<S-C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

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
