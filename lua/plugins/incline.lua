return {
  "b0o/incline.nvim",
  priority = 998,
  lazy = false,

  opts = {
    highlight = {
      groups = {
        InclineNormal = {
          guifg = require("gruvbox").palette.light1,
          blend = 100,
        },
        InclineNormalNC = {
          guifg = require("gruvbox").palette.light4,
          cterm = "italic",
          gui = "italic",
          blend = 100,
        },
      },
    },
    window = {
      margin = {
        vertical = 1,
        horizontal = 0,
      },
      zindex = 1,
      options = {
        winblend = 0,
      },
    },
    hide = {
      cursorline = "focused_win",
      only_win = false,
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":.")
      local icon, color = require("mini.icons").get("file", filename)
      return {
        { icon, group = color },
        { " " },
        { filename },
      }
    end,
  },
}
