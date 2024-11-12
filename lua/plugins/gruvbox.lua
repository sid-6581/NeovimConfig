return {
  "ellisonleao/gruvbox.nvim",
  priority = 2000,
  lazy = false,

  config = function()
    local colors = require("gruvbox").palette

    require("gruvbox").setup({
      contrast = "hard",
      overrides = {
        WinSeparator = { bg = "", blend = 0 },
        VertSplit = { bg = "", blend = 0 },
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

        markdownH1 = { fg = colors.bright_yellow, bold = true },
        markdownH2 = { fg = colors.neutral_yellow, bold = true },
        markdownH3 = { fg = colors.bright_orange, bold = true },
        markdownH4 = { fg = colors.neutral_orange, bold = true },
        markdownH5 = { fg = colors.bright_red, bold = true },
        markdownH6 = { fg = colors.neutral_red, bold = true },

        ["@markup.heading.1"] = { link = "markdownH1" },
        ["@markup.heading.2"] = { link = "markdownH2" },
        ["@markup.heading.3"] = { link = "markdownH3" },
        ["@markup.heading.4"] = { link = "markdownH4" },
        ["@markup.heading.5"] = { link = "markdownH5" },
        ["@markup.heading.6"] = { link = "markdownH6" },

        GruvboxAqua = { bg = "", blend = 0 },
        GruvboxAquaBold = { bg = "", blend = 0 },
        GruvboxAquaSign = { bg = "", blend = 0 },
        GruvboxAquaUnderline = { bg = "", blend = 0, underdotted = true },
        GruvboxBg0 = { bg = "", blend = 0 },
        GruvboxBg1 = { bg = "", blend = 0 },
        GruvboxBg2 = { bg = "", blend = 0 },
        GruvboxBg3 = { bg = "", blend = 0 },
        GruvboxBg4 = { bg = "", blend = 0 },
        GruvboxBlue = { bg = "", blend = 0 },
        GruvboxBlueBold = { bg = "", blend = 0 },
        GruvboxBlueSign = { bg = "", blend = 0 },
        GruvboxBlueUnderline = { bg = "", blend = 0, underdotted = true },
        GruvboxFg0 = { bg = "", blend = 0 },
        GruvboxFg1 = { bg = "", blend = 0 },
        GruvboxFg2 = { bg = "", blend = 0 },
        GruvboxFg3 = { bg = "", blend = 0 },
        GruvboxFg4 = { bg = "", blend = 0 },
        GruvboxGray = { bg = "", blend = 0 },
        GruvboxGreen = { bg = "", blend = 0 },
        GruvboxGreenBold = { bg = "", blend = 0 },
        GruvboxGreenSign = { bg = "", blend = 0 },
        GruvboxGreenUnderline = { bg = "", blend = 0, underdotted = true },
        GruvboxOrange = { bg = "", blend = 0 },
        GruvboxOrangeBold = { bg = "", blend = 0 },
        GruvboxOrangeSign = { bg = "", blend = 0 },
        GruvboxOrangeUnderline = { bg = "", blend = 0, underdotted = true },
        GruvboxPurple = { bg = "", blend = 0 },
        GruvboxPurpleBold = { bg = "", blend = 0 },
        GruvboxPurpleSign = { bg = "", blend = 0 },
        GruvboxPurpleUnderline = { bg = "", blend = 0, underdotted = true },
        GruvboxRed = { bg = "", blend = 0 },
        GruvboxRedBold = { bg = "", blend = 0 },
        GruvboxRedSign = { bg = "", blend = 0 },
        GruvboxRedUnderline = { bg = "", blend = 0, underdotted = true },
        GruvboxYellow = { bg = "", blend = 0 },
        GruvboxYellowBold = { bg = "", blend = 0 },
        GruvboxYellowSign = { bg = "", blend = 0 },
        GruvboxYellowUnderline = { bg = "", blend = 0, underdotted = true },
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
