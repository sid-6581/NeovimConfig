local util = require("user.util")

local noice = util.safe_require("noice")
if not noice then return end

noice.setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = true,
  },
  views = {
    mini = {
      timeout = 5000,
      -- position = {
      --   row = 1,
      -- },
    },
  },
  routes = {},
})

vim.cmd("highlight link NoiceVirtualText DiagnosticVirtualTextHint")
