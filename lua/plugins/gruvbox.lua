return {
  "ellisonleao/gruvbox.nvim",
  priority = 2000,

  config = function()
    local colors = require("gruvbox").palette

    require("gruvbox").setup({
      contrast = "hard",
      overrides = {
        WinSeparator = { bg = "" },
        VertSplit = { bg = "" },
        IncSearch = { bg = colors.dark0, fg = colors.neutral_yellow, reverse = true },
        Search = { bg = colors.dark0, fg = colors.faded_yellow, reverse = true },
        LspReferenceRead = { fg = "", bg = "", underdotted = true },
        LspReferenceWrite = { fg = "", bg = "", underline = true },

        DiffDelete = { bg = "#4a1a1a" },
        DiffAdd = { bg = "#404632" },
        DiffChange = { bg = "#283541" },
        DiffText = { bg = "#385570", fg = "" },

        DiagnosticVirtualTextError = { fg = colors.bright_red, italic = true },
        DiagnosticVirtualTextWarn = { fg = colors.bright_yellow, italic = true },
        DiagnosticVirtualTextInfo = { fg = colors.bright_blue, italic = true },
        DiagnosticVirtualTextHint = { fg = colors.bright_aqua, italic = true },
        DiagnosticVirtualTextOk = { fg = colors.bright_green, italic = true },

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

    vim.api.nvim_set_hl(0, "CursorLineNr", { link = "LineNr" })
    vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "FloatTitle", { link = "Title" })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "LspReferenceText", {})
  end,
}
