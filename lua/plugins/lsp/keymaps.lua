local M = {}

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
  map("n", "gd", function() require("telescope.builtin").lsp_definitions() end, { desc = "Go to definition symbols" })
  map({ "n", "i" }, "<A-Enter>", vim.lsp.buf.code_action, { desc = "Code action" })
  map("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
  map("n", "<Leader>cf", require("plugins.lsp.formatting").format, { desc = "Format document" })
  map("n", "<Leader>cl", vim.lsp.codelens.run, { desc = "Codelens" })
  map("n", "<Leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
  map("v", "<Leader>cf", require("plugins.lsp.formatting").format, { desc = "Format range" })

  map(
    "n",
    "<Leader>lC1",
    function() vim.notify(vim.inspect(vim.lsp.get_clients()[1])) end,
    { desc = "View LSP server 1 information" }
  )
  map(
    "n",
    "<Leader>lC2",
    function() vim.notify(vim.inspect(vim.lsp.get_clients()[2])) end,
    { desc = "View LSP server 2 information" }
  )
  map(
    "n",
    "<Leader>lC3",
    function() vim.notify(vim.inspect(vim.lsp.get_clients()[3])) end,
    { desc = "View LSP server 3 information" }
  )
end

return M
