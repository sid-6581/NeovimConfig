local M = {
  "nvim-lualine/lualine.nvim",
  lazy = false,
}

function M.config()
  local lualine = require("lualine")
  local noice = require("noice")

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
      unix = "lf",
      dos = "crlf",
      mac = "cr",
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
      if next(clients) == nil then return msg end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then return client.name end
      end
      return msg
    end,
    icon = "",
  }

  local statusline_mode = {
    noice.api.statusline.mode.get,
    cond = noice.api.statusline.mode.has,
    color = { fg = "#ff9e64" },
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
      lualine_c = { diff, statusline_mode },
      lualine_x = { diagnostics, lsp, spaces, "encoding", fileformat, "filetype" },
      lualine_y = { "location" },
      lualine_z = { "progress" },
    },
    inactive_sections = {
      lualine_a = { branch },
      lualine_b = { "filename" },
      lualine_c = { diff, statusline_mode },
      lualine_x = { diagnostics, lsp, spaces, "encoding", fileformat, "filetype" },
      lualine_y = { "location" },
      lualine_z = { "progress" },
    },
    tabline = {
      lualine_a = { { "tabs", mode = 1 } },
      -- lualine_b = { { "windows", filetype_names = { ["neo-tree"] = "", ["alpha"] = "" } } },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "hostname" },
    },
    extensions = {},
  })
end

return M
