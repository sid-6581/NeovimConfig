return {
  on_attach = function(client, _bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end,
}
