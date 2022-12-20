local M = {
  "ellisonleao/gruvbox.nvim",
}

function M.config()
  local gruvbox = require("gruvbox")
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
end

return M
