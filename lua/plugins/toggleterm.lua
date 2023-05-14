return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",

  config = function()
    local shell = (vim.fn.has("win32") == 1) and "pwsh -NoLogo" or vim.o.shell

    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return vim.o.lines * 0.4
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      autochdir = true,
      open_mapping = "<C-\\><C-\\>",
      shading_factor = 2,
      start_in_insert = true,
      dir = vim.fn.getcwd(),
      direction = "float",
      shell = shell,
      persist_size = false,
      persist_mode = false,
      highlights = {
        FloatBorder = {
          link = "WinSeparator",
        },
      },
      float_opts = {
        border = "single",
        winblend = 10,
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal

    local terminal
    ---@diagnostic disable-next-line: missing-global-doc
    function _TERMINAL_TOGGLE()
      if terminal == nil then
        terminal = Terminal:new({
          count = 90,
          hidden = true,
          on_exit = function()
            terminal = nil
          end,
        })
      end
      terminal:toggle()
    end

    local terminal_horizontal
    ---@diagnostic disable-next-line: missing-global-doc
    function _TERMINAL_HORIZONTAL_TOGGLE()
      if terminal_horizontal == nil then
        terminal_horizontal = Terminal:new({
          count = 91,
          direction = "horizontal",
          hidden = true,
          on_exit = function()
            terminal_horizontal = nil
          end,
        })
      end
      terminal_horizontal:toggle()
    end

    local terminal_vertical
    ---@diagnostic disable-next-line: missing-global-doc
    function _TERMINAL_VERTICAL_TOGGLE()
      if terminal_vertical == nil then
        terminal_vertical = Terminal:new({
          count = 92,
          direction = "vertical",
          hidden = true,
          on_exit = function()
            terminal_vertical = nil
          end,
        })
      end
      terminal_vertical:toggle()
    end

    local lazygit
    ---@diagnostic disable-next-line: missing-global-doc
    function _LAZYGIT_TOGGLE()
      if lazygit == nil then
        lazygit = Terminal:new({
          count = 93,
          cmd = "lazygit",
          hidden = true,
          on_exit = function()
            lazygit = nil
          end,
          on_close = function()
            require("neo-tree.events").fire_event("git_event")
          end,
        })
      end
      lazygit:toggle()
    end

    local python
    ---@diagnostic disable-next-line: missing-global-doc
    function _PYTHON_TOGGLE()
      if python == nil then
        python = Terminal:new({
          count = 94,
          cmd = "python",
          hidden = true,
          on_exit = function()
            python = nil
          end,
        })
      end
      python:toggle()
    end

    local mc
    ---@diagnostic disable-next-line: missing-global-doc
    function _MC_TOGGLE()
      if mc == nil then
        mc = Terminal:new({
          count = 95,
          cmd = "mc",
          hidden = true,
          on_exit = function()
            mc = nil
          end,
        })
        mc:toggle()
      end
    end
  end,
}
