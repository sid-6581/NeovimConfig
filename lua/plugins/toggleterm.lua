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
      dir = vim.fn.getcwd(),
      direction = "float",
      shell = shell,
      persist_size = false,
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

    local terminal = Terminal:new({ count = 90, hidden = true })
    function _TERMINAL_TOGGLE()
      terminal:toggle()
    end

    local terminal_horizontal = Terminal:new({ count = 91, direction = "horizontal", hidden = true })
    function _TERMINAL_HORIZONTAL_TOGGLE()
      terminal_horizontal:toggle()
    end

    local terminal_vertical = Terminal:new({ count = 92, direction = "vertical", hidden = true })
    function _TERMINAL_VERTICAL_TOGGLE()
      terminal_vertical:toggle()
    end

    local lazygit = Terminal:new({ count = 93, cmd = "lazygit", hidden = true })
    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    local python = Terminal:new({ count = 94, cmd = "python", hidden = true })
    function _PYTHON_TOGGLE()
      python:toggle()
    end
  end,
}
