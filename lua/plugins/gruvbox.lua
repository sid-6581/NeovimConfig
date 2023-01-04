return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 999,

  config = function()
    local colors = require("gruvbox.palette")

    require("gruvbox").setup({
      contrast = "hard",
      inverse = false,
      overrides = {
        GruvboxAquaSign = { bg = "NONE" },
        GruvboxBlueSign = { bg = "NONE" },
        GruvboxGreenSign = { bg = "NONE" },
        GruvboxOrangeSign = { bg = "NONE" },
        GruvboxPurpleSign = { bg = "NONE" },
        GruvboxRedSign = { bg = "NONE" },
        GruvboxYellowSign = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
        DiffDelete = { bg = colors.neutral_red, fg = colors.dark0 },
        DiffAdd = { bg = colors.neutral_green, fg = colors.dark0 },
        DiffChange = { bg = colors.neutral_aqua, fg = colors.dark0 },
        DiffText = { bg = colors.neutral_yellow, fg = colors.dark0 },
      },
    })

    vim.cmd([[ hi clear ]])
    vim.cmd.colorscheme("gruvbox")
  end,
}
