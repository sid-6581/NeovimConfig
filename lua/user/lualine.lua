local util = require("user.util")

local lualine = util.safe_require("lualine")
if not lualine then
  return
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic", "nvim_lsp" },
  sections = { "error", "warn", "info", "hint" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  colored = true,
  update_in_insert = true,
  always_visible = false,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " },
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local fileformat = {
  "fileformat",
  symbols = {
    unix = " unix", -- e712
    dos = " dos", -- e70f
    mac = " mac", -- e711
  },
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local lsp = {
  function()
    local msg = "-"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = "",
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "neo-tree", "neo-tree-popup", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { branch },
    lualine_b = { "filename" },
    lualine_c = { diff },
    lualine_x = { diagnostics, lsp, spaces, "encoding", fileformat, "filetype" },
    lualine_y = { "location" },
    lualine_z = { "progress" },
  },
  inactive_sections = {
    lualine_a = { branch },
    lualine_b = { "filename" },
    lualine_c = { diff },
    lualine_x = { diagnostics, lsp, spaces, "encoding", fileformat, "filetype" },
    lualine_y = { "location" },
    lualine_z = { "progress" },
  },
  tabline = {
    lualine_a = { "tabs" },
    lualine_b = { { "buffers", filetype_names = { ["neo-tree"] = "", ["alpha"] = "" } } },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { "hostname" },
    lualine_z = {},
  },
  extensions = {},
})
