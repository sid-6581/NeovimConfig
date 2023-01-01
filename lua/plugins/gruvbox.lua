return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 999,

  config = function()
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
      },
    })

    vim.cmd([[ hi clear ]])
    vim.cmd.colorscheme("gruvbox")
  end,
}
