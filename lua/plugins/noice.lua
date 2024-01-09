return {
  "folke/noice.nvim",
  event = "VeryLazy",

  keys = {
    {
      mode = { "n", "i", "s" },
      "<C-f>",
      function()
        if not require("noice.lsp").scroll(1) then return "<C-f>" end
      end,
      { desc = "Scroll down (hover)", expr = true },
    },
    {
      mode = { "n", "i", "s" },
      "<C-b>",
      function()
        if not require("noice.lsp").scroll(-1) then return "<C-b>" end
      end,
      { desc = "Scroll up (hover)", expr = true },
    },
    {
      mode = { "c" },
      "<S-Enter>",
      function() require("noice").redirect(vim.fn.getcmdline() or "") end,
      { desc = "Redirect cmdline to noice" },
    },
  },

  opts = {
    -- cmdline = {
    --   view = "cmdline",
    --   format = {
    --     cmdline = { conceal = false },
    --     search_down = { conceal = false },
    --     search_up = { conceal = false },
    --     filter = { conceal = false },
    --     lua = { conceal = false },
    --     help = { conceal = false },
    --     input = { conceal = false },
    --   },
    -- },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      documentation = {
        opts = {
          border = "single",
          size = {
            max_height = 30,
            max_width = 120,
          },
          win_options = {
            winblend = 0,
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
      cmdline_popup = {
        position = {
          row = "30%",
        },
        border = {
          style = "single",
        },
        size = {
          width = "50%",
        },
      },
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
            { event = "lsp", find = "Processing" },
            { event = "lsp", find = "metadata" },
            {
              event = "lsp",
              cond = function(message)
                local client = vim.tbl_get(message.opts, "progress", "client")
                local title = vim.tbl_get(message.opts, "progress", "title")
                return client == "rust_analyzer" and (title == "Loading" or title == nil)
              end,
            },
          },
        },
        opts = {
          skip = true,
          stop = true,
        },
      },
    },
  },

  config = function(_, opts)
    require("noice").setup(opts)

    local NoiceScrollbar = require("noice.view.scrollbar")
    ---@diagnostic disable-next-line: duplicate-set-field
    NoiceScrollbar.show = function(_self) end
    ---@diagnostic disable-next-line: duplicate-set-field
    NoiceScrollbar.update = function(_self) end

    vim.api.nvim_set_hl(0, "NoiceVirtualText", { link = "DiagnosticVirtualTextHint" })
  end,
}
