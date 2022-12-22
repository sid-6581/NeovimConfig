local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
}

function M.config()
  local noice = require("noice")

  noice.setup({
    cmdline = {
      view = "cmdline",
      format = {
        cmdline = { conceal = false },
        search_down = { conceal = false },
        search_up = { conceal = false },
        filter = { conceal = false },
        lua = { conceal = false },
        help = { conceal = false },
        input = { conceal = false },
      },
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = false,
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
end

return M