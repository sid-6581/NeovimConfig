return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,

  keys = {
    { "<A-s>", function() require("snacks").scratch() end, desc = "Toggle scratch buffer [snacks]" },
    { "<S-A-s>", function() require("snacks").scratch.select() end, desc = "Select scratch buffer [snacks]" },
    { "<Leader>gB", function() require("snacks").gitbrowse() end, desc = "Git browse [snacks]" },
    { "<Leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit [snacks]" },
    { "<Leader>gl", function() require("snacks").git.blame_line() end, desc = "Git history (line) [snacks]" },
    { "<Leader>bd", function() require("snacks").bufdelete() end, desc = "Delete buffer [snacks]" },
    { "<S-Esc>", function() require("snacks").bufdelete() end, desc = "Delete buffer [snacks]" },
    { "[[", function() require("snacks").words.jump(-vim.v.count1) end, desc = "Previous reference [snacks]" },
    { "]]", function() require("snacks").words.jump(vim.v.count1) end, desc = "Next reference [snacks]" },
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
    bigfile = {
      enabled = true,
    },

    explorer = {
      enabled = true,
      replace_netrw = false,
    },

    indent = {
      enabled = true,

      animate = {
        enabled = false,
      },

      indent = {
        enabled = true,
        only_scope = true,
        only_current = true,
      },

      scope = {
        enabled = true,
        only_current = true,
        hl = "Constant",
      },

      chunk = {
        enabled = true,
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
        },
        hl = "Constant",
      },
    },

    input = {
      enabled = true,
    },

    lazygit = {
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
      debounce = 0,
      keys = {
        --- @type table<string, snacks.scope.TextObject|{desc?:string}>
        textobject = {
          ii = {
            cursor = true,
            desc = "inner scope",
            edge = false,
            min_size = 2,
            treesitter = { blocks = { enabled = false } },
          },
          ai = {
            cursor = true,
            desc = "full scope",
            edge = true,
            min_size = 2,
            treesitter = { blocks = { enabled = false } },
          },
        },
        --- @type table<string, snacks.scope.Jump|{desc?:string}>
        jump = {
          ["[i"] = {
            bottom = false,
            cursor = true,
            desc = "jump to top edge of scope",
            edge = true,
            min_size = 1,
            treesitter = { blocks = { enabled = false } },
          },
          ["]i"] = {
            bottom = true,
            cursor = false,
            desc = "jump to bottom edge of scope",
            edge = true,
            min_size = 1,
            treesitter = { blocks = { enabled = false } },
          },
        },
      },
    },

    terminal = {
      win = {
        wo = {
          winbar = "",
        },
      },
    },

    win = {
      backdrop = false,
    },

    words = {
      enabled = true,
      debounce = 0,
    },

    styles = {
      lazygit = {
        border = "rounded",
      },
      terminal = {
        border = "rounded",
      },
      float = {
        backdrop = false,
      },
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
      return win(vim.tbl_extend("force", opts or {}, { ft = "lua", text = vim.inspect(obj) }))
    end

    snacks.toggle.option("buflisted"):map("<Leader>bl")
    snacks.toggle.option("modified"):map("<Leader>bm")
    snacks.toggle.option("cursorcolumn"):map("<Leader>uC")
    snacks.toggle.option("cursorline"):map("<Leader>uc")
    snacks.toggle.option("wrap"):map("<Leader>uw")
    snacks.toggle.option("relativenumber"):map("<Leader>ur")
    snacks.toggle.inlay_hints({ name = "inlay hints" }):map("<Leader>uh")
    snacks.toggle.line_number({ name = "line numbers" }):map("<Leader>ul")
    snacks.toggle.diagnostics():map("<Leader>ud")
    snacks.toggle.zoom():map("<A-=>")

    snacks.toggle({
      name = "auto format (buffer)",
      get = function()
        return not vim.b[vim.api.nvim_get_current_buf()].disable_autoformat
      end,
      set = function(state)
        vim.b[vim.api.nvim_get_current_buf()].disable_autoformat = not state
      end,
    }):map("<Leader>uf")

    snacks.toggle({
      name = "auto format (global)",
      get = function()
        return not vim.g.disable_autoformat
      end,
      set = function(state)
        vim.g.disable_autoformat = not state
      end,
    }):map("<Leader>uF")
  end,
}
