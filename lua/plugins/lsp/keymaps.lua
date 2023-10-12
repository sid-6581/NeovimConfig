local M = {}

-- stylua: ignore
function M.on_attach(_client, buffer)
  local map = function(mode, lhs, rhs, opts)
    vim.tbl_deep_extend("force", { buffer = buffer, silent = true, noremap = true }, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- Diagnostics
  map("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostics" })
  map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
  map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

  -- LSP
  map("n", "K", vim.lsp.buf.hover, { desc = "Show information" })
  map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
  map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
  map({ "n", "i" }, "<A-Enter>", vim.lsp.buf.code_action, { desc = "Code action" })
  map("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
  map("n", "<Leader>cf", require("plugins.lsp.formatting").format, { desc = "Format document" })
  map("n", "<Leader>cl", vim.lsp.codelens.run, { desc = "Codelens" })
  map("n", "<Leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
  map("v", "<Leader>cf", require("plugins.lsp.formatting").format, { desc = "Format range" })

  map("n", "<Leader>lC1", function() print(vim.inspect(vim.lsp.get_clients()[1])) end, { desc = "View LSP server 1 information" })
  map("n", "<Leader>lC2", function() print(vim.inspect(vim.lsp.get_clients()[2])) end, { desc = "View LSP server 2 information" })
  map("n", "<Leader>lC3", function() print(vim.inspect(vim.lsp.get_clients()[3])) end, { desc = "View LSP server 3 information" })

  -- Symbols-outline
  map("n", "<Leader>co", "<CMD>SymbolsOutline<CR>", { desc = "Symbols outline" })

  -- LSP lines
  map("n", "<Leader>lL", function() require("lsp_lines").toggle() end, { desc = "Show LSP lines" })

  -- Telescope
  map("n", "<Leader>ld", function() require("telescope.builtin").diagnostics() end, { desc = "Workspace diagnostics" })
  map("n", "<Leader>lD", function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, { desc = "Document diagnostics" })
  map("n", "<Leader>lr", function() require("telescope.builtin").lsp_references() end, { desc = "References" })
  map("n", "<Leader>ls", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, { desc = "Workspace symbols" })
  map("n", "<Leader>lS", function() require("telescope.builtin").lsp_document_symbols() end, { desc = "Document symbols" })

  -- Trouble
  map("n", "<Leader>xx", function() require("trouble").toggle() end, { desc = "Toggle trouble" })
  map("n", "<Leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Toggle workspace diagnostics" })
  map("n", "<Leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Toggle document diagnostics" })
  map("n", "<Leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Toggle loc list" })
  map("n", "<Leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Toggle quickfix" })
  map("n", "<Leader>xr", function() require("trouble").toggle("lsp_references") end, { desc = "Toggle references" })
end

return M
