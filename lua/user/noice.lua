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
    long_message_to_split = true,
    lsp_doc_border = true,
  },
  routes = {
    {
      opts = { skip = true },
      filter = { event = "msg_show", find = "Hop " },
    },
    {
      opts = { skip = true },
      filter = { event = "msg_show", find = "Neovide" },
    },
    {
      filter = { event = "msg_show", kind = "", find = "written" },
      view = "mini",
    },
  },
})
