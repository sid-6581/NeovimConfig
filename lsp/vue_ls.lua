return {
  on_init = function(client)
    client.handlers["tsserver/request"] = function(_, result, context)
      local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })

      if #clients == 0 then
        vim.notify("Could not find `vtsls` LSP client, vue_ls will not work without it.", vim.log.levels.ERROR)
        return
      end

      local ts_client = clients[1]

      local param = unpack(result)
      local id, command, payload = unpack(param)

      ts_client:exec_cmd(
        {
          title = "",
          command = "typescript.tsserverRequest",
          arguments = {
            command,
            payload,
          },
        },
        {
          bufnr = context.bufnr,
        },
        function(_, r)
          local response_data = { { id, r and r.body } }
          client:notify("tsserver/response", response_data)
        end)
    end
  end,

  settings = {
    emmet = {
      showExpandedAbbreviation = "never",
    },
  },
}
