return {
  "b0o/incline.nvim",
  priority = 998,

  opts = {
    highlight = {
      groups = {
        InclineNormal = {
          guifg = require("util.colors").colors.light1,
          blend = 100,
        },
        InclineNormalNC = {
          guifg = require("util.colors").colors.light4,
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
      local icon, color = MiniIcons.get("file", filename)
      return {
        { icon, group = color },
        { " " },
        { filename },
      }
    end,
  },
}
