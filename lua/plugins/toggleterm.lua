return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",

  config = function()
    local shell = (vim.fn.has("win32") == 1) and "pwsh -NoLogo" or vim.o.shell

    require("toggleterm").setup({
      size = 20,
      open_mapping = "<C-\\><C-\\>",
      shading_factor = 2,
      dir = vim.fn.getcwd(),
      direction = "float",
      shell = shell,
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

    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    local node = Terminal:new({ cmd = "node", hidden = true })
    function _NODE_TOGGLE()
      node:toggle()
    end

    local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
    function _NCDU_TOGGLE()
      ncdu:toggle()
    end

    local htop = Terminal:new({ cmd = "htop", hidden = true })
    function _HTOP_TOGGLE()
      htop:toggle()
    end

    local python = Terminal:new({ cmd = "python", hidden = true })
    function _PYTHON_TOGGLE()
      python:toggle()
    end
  end,
}
