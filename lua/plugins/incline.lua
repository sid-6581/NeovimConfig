return {
  "b0o/incline.nvim",
  priority = 998,

  opts = {
    highlight = {
      groups = {
        InclineNormal = {
          guifg = require("gruvbox").palette.light1,
        },
        InclineNormalNC = {
          guifg = require("gruvbox").palette.light4,
          cterm = "italic",
          gui = "italic",
        },
      },
    },

    window = {
      margin = {
        vertical = 0,
        horizontal = 0,
      },
      zindex = 1,
      options = {
        winblend = 0,
      },
      placement = {
        vertical = "bottom",
        horizontal = "left",
      },
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
