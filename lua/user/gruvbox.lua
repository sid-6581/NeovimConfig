local util = require("user.util")

local gruvbox = util.safe_require("gruvbox")
if not gruvbox then return end

local palette = require("gruvbox.palette")
gruvbox.setup({
  contrast = "hard",
  overrides = {
    GruvboxAquaSign = { bg = palette.dark0_hard },
    GruvboxBlueSign = { bg = palette.dark0_hard },
    GruvboxGreenSign = { bg = palette.dark0_hard },
    GruvboxOrangeSign = { bg = palette.dark0_hard },
    GruvboxPurpleSign = { bg = palette.dark0_hard },
    GruvboxRedSign = { bg = palette.dark0_hard },
    GruvboxYellowSign = { bg = palette.dark0_hard },
    SignColumn = { bg = palette.dark0_hard },
  },
})
vim.cmd.colorscheme("gruvbox")
