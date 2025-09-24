return {
  "folke/noice.nvim",
  event = "VeryLazy",

  dependencies = {
    "folke/snacks.nvim",
  },

  keys = {
    {
      "<A-n>",
      function()
        if vim.api.nvim_get_option_value("filetype", {}) == "noice" then
          vim.cmd.bdelete()
        else
          require("noice").cmd("all")
        end
      end,
      desc = "Show notifications [noice]",
    },
    {
      "<C-f>",
      function() if not require("noice.lsp").scroll(1) then return "<C-f>" end end,
      mode = { "n", "i", "s" },
      expr = true,
      desc = "Scroll down (hover) [noice]",
    },
    {
      "<C-b>",
      function() if not require("noice.lsp").scroll(-1) then return "<C-b>" end end,
      mode = { "n", "i", "s" },
      expr = true,
      desc = "Scroll up (hover) [noice]",
    },
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline() or "") end, mode = { "c" }, desc = "Redirect cmdline [noice]" },
  },

  --- @type NoiceConfig
  opts = {
    cmdline = {
      view = "cmdline",
    },

    lsp = {
      progress = {
        enabled = false,
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
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
        relative = "cursor",
        position = { row = -2, col = 0 },
      },

      mini = {
        timeout = 5000,
        win_options = {
          winblend = 100,
        },
      },

      confirm = {
        relative = "cursor",
        position = { row = -2, col = 0 },
      },
    },

    redirect = {
      view = "split",
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
            { event = "msg_show", find = ":checkhealth vim.deprecated" },
            { event = "msg_show", find = "line less" },
            { event = "msg_show", find = "more line" },
            { event = "msg_show", find = "changes;" },
            { event = "msg_show", find = "change;" },
            { event = "msg_show", find = "^/" },
            { event = "msg_show", find = "B written" },
            -- Needed because roslyn doesn't follow the LSP spec, causing lualine LSP progress to fail.
            { error = true, find = "Error in LspProgress Autocommands" },
            { error = true, find = "Pattern not found" },
            { error = true, find = "Error executing luv callback" },
            { error = true, find = "Invalid buffer id" },
            { event = "notify", find = "Config Change Detected" },
            { event = "notify", find = "position_encoding param is required" },
            { event = "notify", find = "No information available" },
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

  specs = {
    "nvim-lualine/lualine.nvim",

    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 1, {
        require("noice").api.status.mode["get"],
        cond = require("noice").api.status.mode["has"],
        color = { fg = "#ff9e64" },
      })
    end,
  },
}
