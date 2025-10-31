return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,

  keys = {
    { "<A-s>", function() require("snacks").scratch() end, desc = "Toggle scratch buffer [snacks]" },
    { "<S-A-s>", function() require("snacks").scratch.select() end, desc = "Select scratch buffer [snacks]" },
    { "<Leader>gB", function() require("snacks").gitbrowse() end, desc = "Git browse [snacks]" },
    { "<Leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit [snacks]" },
    { "<Leader>gL", function() require("snacks").git.blame_line() end, desc = "Git history (line) [snacks]" },
    { "<Leader>bd", function() require("snacks").bufdelete() end, desc = "Delete buffer [snacks]" },
    { "Q", function() require("snacks").bufdelete() end, desc = "Delete buffer [snacks]" },
    { "[[", function() require("snacks").words.jump(-1) end, desc = "Previous reference [snacks]" },
    { "]]", function() require("snacks").words.jump(1) end, desc = "Next reference [snacks]" },
    {
      "<C-->",
      function() require("snacks").terminal("nu -i", { env = { ["SNACKS_TERMINAL"] = "bottom" }, win = { position = "bottom" } }) end,
      mode = { "n", "t" },
      desc = "Horizontal terminal [snacks]",
    },
    {
      "<C-=>",
      function() require("snacks").terminal("nu -i", { env = { ["SNACKS_TERMINAL"] = "float" }, win = { position = "float" } }) end,
      mode = { "n", "t" },
      desc = "Float terminal [snacks]",
    },
    {
      "<C-\\>",
      function() require("snacks").terminal("nu -i", { env = { ["SNACKS_TERMINAL"] = "right" }, win = { position = "right" } }) end,
      mode = { "n", "t" },
      desc = "Vertical terminal [snacks]",
    },
  },

  --- @type snacks.Config
  opts = {
    animate = {
      fps = 120,
    },

    bigfile = {
      enabled = false,
    },

    explorer = {
      enabled = false,
      replace_netrw = false,
    },

    image = {
      enabled = true,
      --- @diagnostic disable-next-line: missing-fields
      convert = {
        notify = false,
      },
      math = {
        enabled = false,
      },
    },

    indent = {
      enabled = true,

      animate = {
        enabled = true,
      },

      indent = {
        enabled = true,
        only_scope = false,
        only_current = false,
        hl = "GruvboxBg1",
      },

      scope = {
        enabled = true,
        cursor = true,
        only_current = false,
        hl = "GruvboxBg4",
      },

      chunk = {
        enabled = true,
        char = {
          arrow = " ",
          corner_top = "╭",
          corner_bottom = "╰",
          horizontal = " ",
        },
        hl = "GruvboxBg4",
      },
    },

    input = {
      enabled = true,
    },

    lazygit = {
      --- @diagnostic disable-next-line: missing-fields
      theme = {
        activeBorderColor = { fg = "MoreMsg" },
      },
    },

    notifier = {
      enabled = true,
      timeout = 5000,
    },

    quickfile = {
      enabled = true,
    },

    scope = {
      enabled = true,
      cursor = false,
      debounce = 0,
      keys = {
        --- @type table<string, snacks.scope.TextObject|{desc?:string}>
        textobject = {
          ii = {
            cursor = false,
            desc = "inner scope",
            edge = false,
            min_size = 2,
            linewise = true,
            treesitter = { blocks = { enabled = false } },
          },
          ai = {
            cursor = false,
            desc = "full scope",
            edge = true,
            min_size = 2,
            linewise = true,
            treesitter = { blocks = { enabled = false } },
          },
        },
        --- @type table<string, snacks.scope.Jump|{desc?:string}>
        jump = {
          ["[i"] = {
            bottom = false,
            cursor = false,
            desc = "jump to top edge of scope",
            edge = true,
            min_size = 2,
            treesitter = { blocks = { enabled = false } },
          },
          ["]i"] = {
            bottom = true,
            cursor = false,
            desc = "jump to bottom edge of scope",
            edge = true,
            min_size = 2,
            treesitter = { blocks = { enabled = false } },
          },
        },
      },
    },

    -- scroll = {
    --   animate = {
    --     duration = { total = 150 },
    --   },
    --   animate_repeat = {
    --     duration = { total = 50 },
    --   },
    -- },

    scratch = {
      --- @diagnostic disable-next-line: missing-fields
      win = {
        keys = {
          ["<A-s>"] = "close",
        },
      },
    },

    statuscolumn = {
      enabled = true,
    },

    terminal = {
      win = {
        wo = {
          winbar = "",
        },
      },
    },

    words = {
      enabled = true,
      debounce = 0,
    },

    styles = {
      input = {
        relative = "cursor",
        row = -3,
        col = 0,
        keys = {
          i_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "i", expr = true },
        },
      },
      --- @diagnostic disable-next-line: missing-fields
      lazygit = {
        border = "rounded",
      },
      --- @diagnostic disable-next-line: missing-fields
      terminal = {
        border = "rounded",
      },
      --- @diagnostic disable-next-line: missing-fields
      zen = {
        border = "none",
      },
    },
  },

  config = function(_, opts)
    local snacks = require("snacks")
    snacks.setup(opts)

    _G.dd = function(...)
      require("snacks").debug.inspect(...)
    end

    _G.bt = function()
      require("snacks").debug.backtrace()
    end

    vim.print = _G.dd

    -- Replace snacks explorer confirm dialog.
    --- @diagnostic disable-next-line: duplicate-set-field
    require("snacks.explorer.actions").confirm = function(prompt, fn)
      if vim.fn.confirm(prompt, "&Yes\n&No", 2) == 1 then
        fn()
      end
    end

    --- Show a window.
    --- @param opts? snacks.win.Config
    --- @return snacks.win
    --- @diagnostic disable-next-line: redefined-local
    _G.win = function(opts)
      if opts then
        local text = type(opts.text) == "function" and opts.text() or opts.text
        text = type(text) == "string" and vim.split(text, "\n") or text
        opts = vim.tbl_extend("force", opts, { text = text })
      end

      return require("snacks").win.new(opts)
    end

    --- Show a lua object in a window.
    --- @param obj any
    --- @param opts? snacks.win.Config
    --- @return snacks.win
    --- @diagnostic disable-next-line: redefined-local
    _G.show = function(obj, opts)
      return win(vim.tbl_extend("force", opts or {}, { ft = "lua", text = vim.inspect(obj), border = "rounded" }))
    end

    snacks.toggle.diagnostics():map("<Leader>ud")
    snacks.toggle.dim():map("<Leader>uD")
    snacks.toggle.inlay_hints({ name = "inlay hints" }):map("<Leader>uh")
    snacks.toggle.line_number({ name = "line numbers" }):map("<Leader>ul")
    snacks.toggle.option("buflisted"):map("<Leader>bl")
    snacks.toggle.option("conceallevel", { on = 2, off = 0 }):map("<Leader>uH")
    snacks.toggle.option("cursorcolumn"):map("<Leader>uC")
    snacks.toggle.option("cursorline"):map("<Leader>uc")
    snacks.toggle.option("modified"):map("<Leader>bm")
    snacks.toggle.option("relativenumber"):map("<Leader>ur")
    snacks.toggle.option("wrap"):map("<Leader>uw")
    snacks.toggle.indent():map("<Leader>ui")
    snacks.toggle.scroll():map("<Leader>uS")
    snacks.toggle.words():map("<Leader>uW")
    snacks.toggle.zen():map("<Leader>uz")
    snacks.toggle.zoom():map("<A-=>")

    snacks.toggle({
      name = "auto format (buffer)",
      get = function() return not vim.b[vim.api.nvim_get_current_buf()].disable_autoformat end,
      set = function(state) vim.b[vim.api.nvim_get_current_buf()].disable_autoformat = not state end,
    }):map("<Leader>uf")

    snacks.toggle({
      name = "auto format (global)",
      get = function() return not vim.g.disable_autoformat end,
      set = function(state) vim.g.disable_autoformat = not state end,
    }):map("<Leader>uF")

    vim.api.nvim_set_hl(0, "SnacksPickerBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "SnacksPickerMatch", { link = "Search" })
    vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { link = "CursorLine" })
    vim.api.nvim_set_hl(0, "SnacksPickerPreviewCursorLine", { link = "CursorLine" })
  end,
}
