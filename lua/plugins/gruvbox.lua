return {
  "ellisonleao/gruvbox.nvim",
  priority = 2000,

  config = function()
    local colors = require("gruvbox").palette

    --- @diagnostic disable-next-line: missing-fields
    require("gruvbox").setup({
      contrast = "hard",
      overrides = {
        CursorLineNr = { fg = "", bg = "", link = "LineNr" },
        DiagnosticVirtualTextError = { fg = colors.bright_red, italic = true },
        DiagnosticVirtualTextHint = { fg = colors.bright_aqua, italic = true },
        DiagnosticVirtualTextInfo = { fg = colors.bright_blue, italic = true },
        DiagnosticVirtualTextOk = { fg = colors.bright_green, italic = true },
        DiagnosticVirtualTextWarn = { fg = colors.bright_yellow, italic = true },
        DiffAdd = { bg = "#404632" },
        DiffChange = { bg = "#283541" },
        DiffDelete = { bg = "#4a1a1a" },
        DiffText = { bg = "#385570", fg = "" },
        ErrorMsg = { fg = colors.bright_red, bg = "" },
        FloatBorder = { fg = colors.bright_blue },
        FloatTitle = { fg = "", bg = "", link = "Title" },
        IncSearch = { bg = "#ffffff", fg = "#385570", reverse = true },
        LspReferenceRead = { fg = "", bg = "", underdotted = true },
        LspReferenceText = { link = "" },
        LspReferenceWrite = { fg = "", bg = "", underline = true },
        NonText = { link = "GruvboxBg4" },
        NormalFloat = { fg = "", bg = "", link = "Normal" },
        Search = { bg = "#ffffff", fg = "#385570", reverse = true },
        SignColumn = { fg = "", bg = "", link = "LineNr" },
        WinSeparator = { bg = "" },
        StatusLine = { link = "Normal" },
        StatusLineNC = { link = "NormalNC" },
        StatusLineTerm = { link = "Normal" },
        StatusLineTermNC = { link = "NormalNC" },
        TabLine = { link = "Normal" },
        TabLineFill = { link = "Normal" },
        WinBar = { link = "Normal" },
        WinBarNC = { link = "NormalNC" },

        markdownH1 = { fg = colors.neutral_red, bold = true },
        markdownH2 = { fg = colors.neutral_yellow, bold = true },
        markdownH3 = { fg = colors.neutral_green, bold = true },
        markdownH4 = { fg = colors.neutral_aqua, bold = true },
        markdownH5 = { fg = colors.neutral_blue, bold = true },
        markdownH6 = { fg = colors.neutral_purple, bold = true },
        ["@markup.heading.1"] = { link = "markdownH1" },
        ["@markup.heading.2"] = { link = "markdownH2" },
        ["@markup.heading.3"] = { link = "markdownH3" },
        ["@markup.heading.4"] = { link = "markdownH4" },
        ["@markup.heading.5"] = { link = "markdownH5" },
        ["@markup.heading.6"] = { link = "markdownH6" },

        GruvboxAqua = { bg = "" },
        GruvboxAquaBold = { bg = "" },
        GruvboxAquaSign = { bg = "" },
        GruvboxAquaUnderline = { bg = "", underdotted = true },
        GruvboxBg0 = { bg = "" },
        GruvboxBg1 = { bg = "" },
        GruvboxBg2 = { bg = "" },
        GruvboxBg3 = { bg = "" },
        GruvboxBg4 = { bg = "" },
        GruvboxBlue = { bg = "" },
        GruvboxBlueBold = { bg = "" },
        GruvboxBlueSign = { bg = "" },
        GruvboxBlueUnderline = { bg = "", underdotted = true },
        GruvboxFg0 = { bg = "" },
        GruvboxFg1 = { bg = "" },
        GruvboxFg2 = { bg = "" },
        GruvboxFg3 = { bg = "" },
        GruvboxFg4 = { bg = "" },
        GruvboxGray = { bg = "" },
        GruvboxGreen = { bg = "" },
        GruvboxGreenBold = { bg = "" },
        GruvboxGreenSign = { bg = "" },
        GruvboxGreenUnderline = { bg = "", underdotted = true },
        GruvboxOrange = { bg = "" },
        GruvboxOrangeBold = { bg = "" },
        GruvboxOrangeSign = { bg = "" },
        GruvboxOrangeUnderline = { bg = "", underdotted = true },
        GruvboxPurple = { bg = "" },
        GruvboxPurpleBold = { bg = "" },
        GruvboxPurpleSign = { bg = "" },
        GruvboxPurpleUnderline = { bg = "", underdotted = true },
        GruvboxRed = { bg = "" },
        GruvboxRedBold = { bg = "" },
        GruvboxRedSign = { bg = "" },
        GruvboxRedUnderline = { bg = "", underdotted = true },
        GruvboxYellow = { bg = "" },
        GruvboxYellowBold = { bg = "" },
        GruvboxYellowSign = { bg = "" },
        GruvboxYellowUnderline = { bg = "", underdotted = true },
      },
    })

    vim.cmd.colorscheme("gruvbox")
  end,
}
