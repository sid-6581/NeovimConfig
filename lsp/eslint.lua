return {
  on_attach = function(client, _bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end,
  root_dir = function(bufnr, on_dir)
    local root_markers = { { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" }, { ".git" } }
    local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
    on_dir(project_root)
  end,
}
