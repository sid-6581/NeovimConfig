return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 999,

  config = function()
    local colors = require("gruvbox.palette")

    require("gruvbox").setup({
      contrast = "hard",
      overrides = {
        GruvboxAquaSign = { bg = "NONE" },
        GruvboxBlueSign = { bg = "NONE" },
        GruvboxGreenSign = { bg = "NONE" },
        GruvboxOrangeSign = { bg = "NONE" },
        GruvboxPurpleSign = { bg = "NONE" },
        GruvboxRedSign = { bg = "NONE" },
        GruvboxYellowSign = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
        DiffDelete = { bg = colors.neutral_red, fg = colors.dark0, reverse = false },
        DiffAdd = { bg = colors.neutral_green, fg = colors.dark0, reverse = false },
        DiffChange = { bg = colors.neutral_aqua, fg = colors.dark0, reverse = false },
        DiffText = { bg = colors.neutral_yellow, fg = colors.dark0, reverse = false },
      },
    })

    vim.cmd([[ hi clear ]])
    vim.cmd.colorscheme("gruvbox")

    vim.api.nvim_set_hl(0, "FloatBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "FloatTitle", { link = "Title" })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
  end,
}
