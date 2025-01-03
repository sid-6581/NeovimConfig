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
    { "<Leader>ty", function() require("snacks").terminal("yazi") end, desc = "Yazi [snacks]" },
  },

  --- @type snacks.Config
  opts = {
    indent = {
      enabled = true,

      animate = {
        enabled = false,
      },

      indent = {
        enabled = false,
        only_scope = true,
        only_current = true,
        hl = "Constant",
      },

      scope = {
        enabled = false,
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

    --- @type table<string, snacks.win.Config>
    styles = {
      lazygit = {
        border = "rounded",
      },
      terminal = {
        border = "rounded",
      },
      float = {
        backdrop = false,
        border = "rounded",
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
