local util = require("user.util")

util.safe_require("impatient")

util.safe_require("user.options")
util.safe_require("user.plugins")
util.safe_require("user.noice")
util.safe_require("user.window-picker")
util.safe_require("user.neo-tree")
util.safe_require("user.lsp")
util.safe_require("user.cmp")
util.safe_require("user.dressing")
util.safe_require("user.telescope")
util.safe_require("user.treesitter")
util.safe_require("user.gitsigns")
util.safe_require("user.lualine")
util.safe_require("user.toggleterm")
util.safe_require("user.project")
util.safe_require("user.indentline")
util.safe_require("user.trouble")
util.safe_require("user.which-key")

local gruvbox = util.safe_require("gruvbox")
if gruvbox then
  gruvbox.setup({
    contrast = "hard",
  })
  vim.cmd.colorscheme("gruvbox")
end
