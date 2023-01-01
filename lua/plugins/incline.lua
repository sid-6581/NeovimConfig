return {
  "b0o/incline.nvim",
  lazy = false,
  priority = 997,

  config = function()
    if vim.g.started_by_firenvim then return end

    require("incline").setup({
      highlight = {
        groups = {
          InclineNormalNC = "Comment",
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
    })
  end,
}
