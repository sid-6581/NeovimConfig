local util = require("user.util")

util.safe_require("impatient")

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

local util = require("user.util")

local gruvbox = util.safe_require("gruvbox")
if gruvbox then
  gruvbox.setup({
    contrast = "hard",
  })
  pcall(vim.cmd.colorscheme, "gruvbox")
end
