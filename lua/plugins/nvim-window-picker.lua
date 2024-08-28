return {
  "s1n7ax/nvim-window-picker",
  event = "VeryLazy",

  config = function()
    local colors = require("util.colors").colors

    require("window-picker").setup({
      highlights = {
        statusline = {
          focused = {
            fg = colors.bright_yellow,
            bg = colors.dark1,
            bold = true,
          },
          unfocused = {
            fg = colors.bright_yellow,
            bg = colors.dark1,
            bold = true,
          },
        },
        winbar = {
          focused = {
            fg = colors.bright_yellow,
            bg = colors.dark1,
            bold = true,
          },
          unfocused = {
            fg = colors.bright_yellow,
            bg = colors.dark1,
            bold = true,
          },
        },
      },
      picker_config = {
        statusline_winbar_picker = {
          selection_display = function(char) return "  " .. char .. "  " end,
        },
      },
    })
  end,
}
