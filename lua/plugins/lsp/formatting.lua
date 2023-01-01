local M = {}

M.autoformat = true

function M.format()
  if M.autoformat then vim.lsp.buf.format() end
end

local function has_formatter(ft)
  local sources = require("null-ls.sources")
  local available = sources.get_available(ft, "NULL_LS_FORMATTING")
  return #available > 0
end

function M.on_attach(client, buf)
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")

  local enable = false

  if has_formatter(ft) then
    enable = client.name == "null-ls"
  else
    enable = not (client.name == "null-ls")
  end

  if client.name == "tsserver" then enable = false end

  client.server_capabilities.documentFormattingProvider = enable

  -- Format on save
  if enable then
    vim.cmd([[
      augroup LspFormat
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua require("plugins.lsp.formatting").format()
      augroup END
    ]])
  end
end

return M
