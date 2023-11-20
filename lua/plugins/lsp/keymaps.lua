local M = {}

function M.on_attach(_client, buffer)
  local map = function(mode, lhs, rhs, opts)
    vim.tbl_deep_extend("force", { buffer = buffer, silent = true, noremap = true }, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- stylua: ignore start

  map("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostics" })
  map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
  map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

  map("n", "<Leader>ca", function() vim.lsp.buf.code_action() end, { desc = "Code action" })
  map("n", "<Leader>cf", function() require("plugins.lsp.formatting").format() end, { desc = "Format document" })
  map("n", "<Leader>cl", function() vim.lsp.codelens.run() end, { desc = "Codelens" })
  map("n", "<Leader>cr", function() vim.lsp.buf.rename() end, { desc = "Rename" })
  map("n", "<Leader>lC1", function() vim.notify(vim.inspect(vim.lsp.get_clients()[1])) end, { desc = "View LSP server 1 information" })
  map("n", "<Leader>lC2", function() vim.notify(vim.inspect(vim.lsp.get_clients()[2])) end, { desc = "View LSP server 2 information" })
  map("n", "<Leader>lC3", function() vim.notify(vim.inspect(vim.lsp.get_clients()[3])) end, { desc = "View LSP server 3 information" })
  map("n", "<Leader>lD", function() require("telescope.builtin").diagnostics({ bufnr = 0 }) end, { desc = "Document diagnostics" })
  map("n", "<Leader>lS", function() require("telescope.builtin").lsp_document_symbols() end, { desc = "Document symbols" })
  map("n", "<Leader>ld", function() require("telescope.builtin").diagnostics() end, { desc = "Workspace diagnostics" })
  map("n", "<Leader>lr", function() require("telescope.builtin").lsp_references() end, { desc = "References" })
  map("n", "<Leader>ls", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, { desc = "Workspace symbols" })
  map("n", "K", function() vim.lsp.buf.hover() end, { desc = "Show information" })
  map("n", "gK", function() vim.lsp.buf.signature_help() end, { desc = "Signature Help" })
  map("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
  map("v", "<Leader>cf", function() require("plugins.lsp.formatting").format() end, { desc = "Format range" })
  map({ "n", "i" }, "<A-Enter>", function() vim.lsp.buf.code_action() end, { desc = "Code action" })

  -- stylua: ignore end
end

return M
