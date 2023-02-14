return {
  "b0o/incline.nvim",
  lazy = false,
  priority = 997,

  opts = {
    highlight = {
      groups = {
        InclineNormal = {
          guifg = require("gruvbox.palette").colors.light1,
          blend = 100,
        },
        InclineNormalNC = {
          guifg = require("gruvbox.palette").colors.light4,
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
    },
    hide = {
      only_win = true,
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      local icon, color = require("nvim-web-devicons").get_icon_color(filename)
      return {
        { icon, guifg = color },
        { " " },
        { filename },
      }
    end,
  },
}
