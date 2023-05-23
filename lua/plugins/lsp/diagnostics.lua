local M = {}

M.signs = {
  Error = "",
  Warn = "",
  Hint = "",
  Info = "",
}

local function get_prefix(diagnostic)
  if diagnostic.severity == vim.diagnostic.severity.ERROR then
    return M.signs.Error
  elseif diagnostic.severity == vim.diagnostic.severity.WARN then
    return M.signs.Warn
  elseif diagnostic.severity == vim.diagnostic.severity.INFO then
    return M.signs.Info
  else
    return M.signs.Hint
  end
end

local function get_max_line_length(bufnr)
  local line_count = vim.api.nvim_buf_line_count(bufnr)
  local max_line_length = 0

  for i = 0, line_count - 1 do
    local line_length = #vim.api.nvim_buf_get_lines(bufnr, i, i + 1, true)[1]
    max_line_length = math.max(line_length, max_line_length)
  end

  return max_line_length
end

-- Hack to align our virtual text.
local get_virt_text_chunks_copy = vim.diagnostic._get_virt_text_chunks
local function get_virt_text_chunks(line_diags, opts)
  local virt_texts = get_virt_text_chunks_copy(line_diags, opts)
  if virt_texts == nil then return nil end
  local last = line_diags[#line_diags]
  local current_line = vim.api.nvim_buf_get_lines(last.bufnr, last.lnum, last.lnum + 1, true)[1]
  local spacing = get_max_line_length(last.bufnr) - #current_line + 1
  virt_texts[1] = { string.rep(" ", spacing) }
  return virt_texts
end

function M.setup()
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.diagnostic._get_virt_text_chunks = get_virt_text_chunks

  vim.diagnostic.config({
    -- virtual_text = { spacing = 20, prefix = "●" },
    virtual_text = {
      spacing = 0,
      prefix = get_prefix,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "single",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
    local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
    vim.diagnostic.reset(ns)
    return vim.NIL
  end

  for type, icon in pairs(M.signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

function M.on_attach(client, _buf)
  if client.supports_method("textDocument/documentHighlight") then
    vim.cmd([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end
  if client.supports_method("textDocument/codeLens") then
    vim.cmd([[
      augroup lsp_codelens_refresh
        autocmd! * <buffer>
        autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()
      augroup END
    ]])
  end
end

return M
