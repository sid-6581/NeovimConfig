return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",

  keys = {
    { "<C-->", function() _TERMINAL_HORIZONTAL_TOGGLE() end, mode = { "n", "i", "v", "t" }, desc = "Horizontal terminal [toggleterm]" },
    { "<C-=>", function() _TERMINAL_TOGGLE() end, mode = { "n", "i", "v", "t" }, desc = "Float terminal [toggleterm]" },
    { "<C-\\>", function() _TERMINAL_VERTICAL_TOGGLE() end, mode = { "n", "i", "v", "t" }, desc = "Vertical terminal [toggleterm]" },
    { "<Leader>gg", function() _LAZYGIT_TOGGLE() end, desc = "Lazygit [toggleterm]" },
    { "<Leader>tf", function() _TERMINAL_TOGGLE() end, desc = "Float terminal [toggleterm]" },
    { "<Leader>th", function() _TERMINAL_HORIZONTAL_TOGGLE() end, desc = "Horizontal terminal [toggleterm]" },
    { "<Leader>tp", function() _PYTHON_TOGGLE() end, desc = "Python [toggleterm]" },
    { "<Leader>tv", function() _TERMINAL_VERTICAL_TOGGLE() end, desc = "Vertical terminal [toggleterm]" },
    { "<Leader>ty", function() _YAZI_TOGGLE() end, desc = "Yazi [toggleterm]" },
  },

  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return math.floor(vim.o.lines * 0.4)
      elseif term.direction == "vertical" then
        return math.floor(vim.o.columns * 0.4)
      end
    end,
    autochdir = true,
    open_mapping = false,
    shading_factor = 0,
    shading_ratio = 0,
    shade_terminals = false,
    start_in_insert = true,
    dir = vim.fn.getcwd(),
    direction = "float",
    shell = "nu -li",
    persist_size = false,
    persist_mode = false,
    highlights = {
      FloatBorder = {
        link = "WinSeparator",
      },
    },
    float_opts = {
      -- width = function() return vim.o.columns - 2 end,
      -- height = function() return vim.o.lines - 4 - vim.o.cmdheight end,
      width = function() return math.floor(vim.o.columns * 0.9) end,
      height = function() return math.floor((vim.o.lines - vim.o.cmdheight) * 0.9) end,
      border = "single",
      winblend = 0,
    },
  },

  config = function(_, opts)
    require("toggleterm").setup(opts)

    local Terminal = require("toggleterm.terminal").Terminal

    local terminal
    function _TERMINAL_TOGGLE()
      if terminal == nil then
        terminal = Terminal:new({
          count = 90,
          hidden = true,
          on_exit = function() terminal = nil end,
        })
      end

      terminal:toggle()
    end

    local terminal_horizontal
    function _TERMINAL_HORIZONTAL_TOGGLE()
      if terminal_horizontal == nil then
        terminal_horizontal = Terminal:new({
          count = 91,
          direction = "horizontal",
          hidden = true,
          on_exit = function() terminal_horizontal = nil end,
        })
      end

      terminal_horizontal:toggle()
    end

    local terminal_vertical
    function _TERMINAL_VERTICAL_TOGGLE()
      if terminal_vertical == nil then
        terminal_vertical = Terminal:new({
          count = 92,
          direction = "vertical",
          hidden = true,
          on_exit = function() terminal_vertical = nil end,
        })
      end

      terminal_vertical:toggle()
    end

    local lazygit
    function _LAZYGIT_TOGGLE()
      if lazygit == nil then
        lazygit = Terminal:new({
          count = 93,
          cmd = "lazygit",
          hidden = true,
          on_exit = function() lazygit = nil end,
          on_close = function() require("neo-tree.events").fire_event("git_event") end,
        })
      end

      lazygit:toggle()
    end

    local python
    function _PYTHON_TOGGLE()
      if python == nil then
        python = Terminal:new({
          count = 94,
          cmd = "python",
          hidden = true,
          on_exit = function() python = nil end,
        })
      end

      python:toggle()
    end

    local yazi
    function _YAZI_TOGGLE()
      if yazi == nil then
        yazi = Terminal:new({
          count = 95,
          cmd = "yazi",
          hidden = true,
          on_exit = function() yazi = nil end,
        })
        yazi:toggle()
      end
    end
  end,
}
