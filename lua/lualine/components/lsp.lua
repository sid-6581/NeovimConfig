local M = require("lualine.component"):extend()

function M:init(options)
  options.icon = options.icon or "󰌘"
  options.split = options.split or ","
  M.super.init(self, options)
end

function M:update_status()
  local buf_clients = vim.lsp.get_clients({ bufnr = 0 })

  local buf_client_names = {}
  for _, client in pairs(buf_clients) do
    table.insert(buf_client_names, client.name)
  end

  return table.concat(buf_client_names, self.options.split)
end

return M
