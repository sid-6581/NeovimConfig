local M = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
}

function M.config()
  local gruvbox = require("gruvbox")

  gruvbox.setup({
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
end

return M
