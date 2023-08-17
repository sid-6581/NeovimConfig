return {
  "folke/noice.nvim",
  event = "VeryLazy",

  opts = {
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
      hover = {
        opts = {
          border = "single",
          win_options = {
            winblend = 10,
          },
        },
      },
    },
    messages = {
      view_search = false,
    },
    popupmenu = {
      backend = "cmp",
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
        winblend = 100,
      },
    },
    commands = {
      all = {
        view = "split",
        opts = { enter = true, format = "details" },
      },
    },
    routes = {
      {
        filter = {
          any = {
            { event = "msg_show", find = "Already at oldest change" },
            { event = "msg_show", find = "fewer lines" },
            { event = "msg_show", find = "line less" },
            { event = "msg_show", find = "more line" },
            { event = "msg_show", find = "changes;" },
            { event = "msg_show", find = "change;" },
            { event = "msg_show", find = "^/" },
            { event = "msg_show", find = "B written" },
            { error = true, find = "Pattern not found" },
            { error = true, find = "Error executing luv callback" },
            { event = "lsp", kind = "progress", find = "code_action" },
            { event = "lsp", find = "Roots Scanned" },
            { event = "lsp", find = "Fetching" },
            { event = "lsp", find = "Loading" },
            { event = "lsp", find = "metadata" },
          },
        },
        opts = { skip = true },
      },
    },
  },

  config = function(_, opts)
    require("noice").setup(opts)

    vim.cmd([[
      highlight link NoiceVirtualText DiagnosticVirtualTextHint
    ]])
  end,
}
