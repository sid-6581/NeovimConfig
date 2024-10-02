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
        IncSearch = { fg = colors.dark0, bg = colors.neutral_yellow, reverse = false },
        Search = { fg = colors.dark0, bg = colors.faded_yellow, reverse = false },
        LspReferenceRead = { fg = "", bg = "", underdotted = true },
        LspReferenceWrite = { fg = "", bg = "", underline = true },

        DiagnosticVirtualTextError = { fg = colors.bright_red, italic = true },
        DiagnosticVirtualTextWarn = { fg = colors.bright_yellow, italic = true },
        DiagnosticVirtualTextInfo = { fg = colors.bright_blue, italic = true },
        DiagnosticVirtualTextHint = { fg = colors.bright_aqua, italic = true },
        DiagnosticVirtualTextOk = { fg = colors.bright_green, italic = true },

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
