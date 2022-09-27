pcall(require, "impatient")

require("user.options")
require("user.plugins")
require("user.notify")
require("user.window-picker")
require("user.neo-tree")
require("user.lsp")
require("user.cmp")
require("user.dressing")
require("user.telescope")
require("user.treesitter")
require("user.gitsigns")
require("user.lualine")
require("user.toggleterm")
require("user.project")
require("user.indentline")
require("user.trouble")
require("user.whichkey")
require("user.alpha")

local gruvbox_status_ok, gruvbox = pcall(require, "gruvbox")
if gruvbox_status_ok then
  gruvbox.setup({
    contrast = "hard",
  })
  pcall(vim.cmd.colorscheme, "gruvbox")
end

