local M = require("lualine.component"):extend()

function M:init(options)
  options.icon = {
    "",
    color = {
      fg = string.format("%06x", vim.api.nvim_get_hl(0, { name = "Directory", link = false }).fg),
    },
  }
  M.super.init(self, options)
end

function M:update_status()
  local cwd = vim.fn.getcwd()
  local home = os.getenv("HOME")

  if home and vim.startswith(cwd, home) then
    cwd = "~" .. cwd:sub(home:len() + 1)
  end

  return cwd
end

return M
