return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,

  config = function()
    local colors = require("util.colors").colors

    require("gruvbox").setup({
      contrast = "hard",
      overrides = {
        GruvboxAqua = { bg = "NONE", blend = 10 },
        GruvboxAquaBold = { bg = "NONE", blend = 10 },
        GruvboxAquaSign = { bg = "NONE", blend = 10 },
        GruvboxAquaUnderline = { bg = "NONE", blend = 10 },
        GruvboxBg0 = { bg = "NONE", blend = 10 },
        GruvboxBg1 = { bg = "NONE", blend = 10 },
        GruvboxBg2 = { bg = "NONE", blend = 10 },
        GruvboxBg3 = { bg = "NONE", blend = 10 },
        GruvboxBg4 = { bg = "NONE", blend = 10 },
        GruvboxBlue = { bg = "NONE", blend = 10 },
        GruvboxBlueBold = { bg = "NONE", blend = 10 },
        GruvboxBlueSign = { bg = "NONE", blend = 10 },
        GruvboxBlueUnderline = { bg = "NONE", blend = 10 },
        GruvboxFg0 = { bg = "NONE", blend = 10 },
        GruvboxFg1 = { bg = "NONE", blend = 10 },
        GruvboxFg2 = { bg = "NONE", blend = 10 },
        GruvboxFg3 = { bg = "NONE", blend = 10 },
        GruvboxFg4 = { bg = "NONE", blend = 10 },
        GruvboxGray = { bg = "NONE", blend = 10 },
        GruvboxGreen = { bg = "NONE", blend = 10 },
        GruvboxGreenBold = { bg = "NONE", blend = 10 },
        GruvboxGreenSign = { bg = "NONE", blend = 10 },
        GruvboxGreenUnderline = { bg = "NONE", blend = 10 },
        GruvboxOrange = { bg = "NONE", blend = 10 },
        GruvboxOrangeBold = { bg = "NONE", blend = 10 },
        GruvboxOrangeSign = { bg = "NONE", blend = 10 },
        GruvboxOrangeUnderline = { bg = "NONE", blend = 10 },
        GruvboxPurple = { bg = "NONE", blend = 10 },
        GruvboxPurpleBold = { bg = "NONE", blend = 10 },
        GruvboxPurpleSign = { bg = "NONE", blend = 10 },
        GruvboxPurpleUnderline = { bg = "NONE", blend = 10 },
        GruvboxRed = { bg = "NONE", blend = 10 },
        GruvboxRedBold = { bg = "NONE", blend = 10 },
        GruvboxRedSign = { bg = "NONE", blend = 10 },
        GruvboxRedUnderline = { bg = "NONE", blend = 10 },
        GruvboxYellow = { bg = "NONE", blend = 10 },
        GruvboxYellowBold = { bg = "NONE", blend = 10 },
        GruvboxYellowSign = { bg = "NONE", blend = 10 },
        GruvboxYellowUnderline = { bg = "NONE", blend = 10 },

        SignColumn = { bg = "NONE", blend = 10 },
        VertSplit = { bg = "NONE", blend = 10 },

        DiagnosticVirtualTextError = { fg = colors.bright_red, italic = true },
        DiagnosticVirtualTextWarn = { fg = colors.bright_yellow, italic = true },
        DiagnosticVirtualTextInfo = { fg = colors.bright_blue, italic = true },
        DiagnosticVirtualTextHint = { fg = colors.bright_aqua, italic = true },
        DiagnosticVirtualTextOk = { fg = colors.bright_green, italic = true },

        DiffDelete = { bg = colors.neutral_red, fg = colors.dark0, reverse = false },
        DiffAdd = { bg = colors.neutral_green, fg = colors.dark0, reverse = false },
        DiffChange = { bg = colors.neutral_aqua, fg = colors.dark0, reverse = false },
        DiffText = { bg = colors.neutral_yellow, fg = colors.dark0, reverse = false },

        IncSearch = { bg = colors.dark0, fg = colors.neutral_yellow, reverse = true },
        Search = { bg = colors.dark0, fg = colors.faded_yellow, reverse = true },
      },
    })

    vim.cmd([[ hi clear ]])
    vim.cmd.colorscheme("gruvbox")

    vim.api.nvim_set_hl(0, "FloatBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "FloatTitle", { link = "Title" })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "GruvboxFg1" })
  end,
}
