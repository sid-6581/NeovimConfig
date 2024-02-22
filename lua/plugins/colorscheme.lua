return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,

  config = function()
    local colors = require("util.colors").colors

    require("gruvbox").setup({
      contrast = "hard",
      overrides = {
        CursorLineNr = { link = "LineNr" },
        SignColumn = { link = "LineNr" },
        WinSeparator = { bg = "", blend = 0 },
        VertSplit = { bg = "", blend = 0 },
        IncSearch = { bg = colors.dark0, fg = colors.neutral_yellow, reverse = true },
        Search = { bg = colors.dark0, fg = colors.faded_yellow, reverse = true },

        DiagnosticVirtualTextError = { fg = colors.bright_red, italic = true },
        DiagnosticVirtualTextWarn = { fg = colors.bright_yellow, italic = true },
        DiagnosticVirtualTextInfo = { fg = colors.bright_blue, italic = true },
        DiagnosticVirtualTextHint = { fg = colors.bright_aqua, italic = true },
        DiagnosticVirtualTextOk = { fg = colors.bright_green, italic = true },

        GruvboxAqua = { bg = "", blend = 0 },
        GruvboxAquaBold = { bg = "", blend = 0 },
        GruvboxAquaSign = { bg = "", blend = 0 },
        GruvboxAquaUnderline = { bg = "", blend = 0 },
        GruvboxBg0 = { bg = "", blend = 0 },
        GruvboxBg1 = { bg = "", blend = 0 },
        GruvboxBg2 = { bg = "", blend = 0 },
        GruvboxBg3 = { bg = "", blend = 0 },
        GruvboxBg4 = { bg = "", blend = 0 },
        GruvboxBlue = { bg = "", blend = 0 },
        GruvboxBlueBold = { bg = "", blend = 0 },
        GruvboxBlueSign = { bg = "", blend = 0 },
        GruvboxBlueUnderline = { bg = "", blend = 0 },
        GruvboxFg0 = { bg = "", blend = 0 },
        GruvboxFg1 = { bg = "", blend = 0 },
        GruvboxFg2 = { bg = "", blend = 0 },
        GruvboxFg3 = { bg = "", blend = 0 },
        GruvboxFg4 = { bg = "", blend = 0 },
        GruvboxGray = { bg = "", blend = 0 },
        GruvboxGreen = { bg = "", blend = 0 },
        GruvboxGreenBold = { bg = "", blend = 0 },
        GruvboxGreenSign = { bg = "", blend = 0 },
        GruvboxGreenUnderline = { bg = "", blend = 0 },
        GruvboxOrange = { bg = "", blend = 0 },
        GruvboxOrangeBold = { bg = "", blend = 0 },
        GruvboxOrangeSign = { bg = "", blend = 0 },
        GruvboxOrangeUnderline = { bg = "", blend = 0 },
        GruvboxPurple = { bg = "", blend = 0 },
        GruvboxPurpleBold = { bg = "", blend = 0 },
        GruvboxPurpleSign = { bg = "", blend = 0 },
        GruvboxPurpleUnderline = { bg = "", blend = 0 },
        GruvboxRed = { bg = "", blend = 0 },
        GruvboxRedBold = { bg = "", blend = 0 },
        GruvboxRedSign = { bg = "", blend = 0 },
        GruvboxRedUnderline = { bg = "", blend = 0 },
        GruvboxYellow = { bg = "", blend = 0 },
        GruvboxYellowBold = { bg = "", blend = 0 },
        GruvboxYellowSign = { bg = "", blend = 0 },
        GruvboxYellowUnderline = { bg = "", blend = 0 },
      },
    })

    vim.cmd([[ hi clear ]])
    vim.cmd.colorscheme("gruvbox")

    vim.api.nvim_set_hl(0, "FloatBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "FloatTitle", { link = "Title" })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "GruvboxFg1" })
  end,
}
