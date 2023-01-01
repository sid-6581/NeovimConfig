local M = {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  priority = 998,

  dependencies = {
    "tiagovla/scope.nvim",
    config = true,
  },
}

function M.config()
  local lualine = require("lualine")
  local noice = require("noice")

  local custom_theme = vim.deepcopy(require("lualine.themes.gruvbox_dark"))
  custom_theme.normal.c.bg = "Normal"

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
    return vim.api.nvim_buf_get_option(0, "shiftwidth") .. " spaces"
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

  lualine.setup({
    options = {
      icons_enabled = true,
      theme = custom_theme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha", "dashboard", "Outline" },
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a = { "hostname", branch },
      lualine_b = { "filename" },
      lualine_c = {
        diff,
        {
          noice.api.status.mode.get,
          cond = noice.api.status.mode.has,
          color = { fg = "#ff9e64" },
        },
        {
          noice.api.status.search.get,
          cond = noice.api.status.search.has,
          color = { fg = "#ff9e64" },
        },
      },
      lualine_x = { diagnostics, lsp, spaces, "encoding", fileformat, "filetype" },
      lualine_y = { "location" },
      lualine_z = { "progress" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = { "filename" },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    -- tabline = {
    --   lualine_a = {
    --     {
    --       "buffers",
    --       filetype_names = { ["neo-tree"] = "", ["alpha"] = "" },
    --       disabled_buftypes = { "quickfix", "prompt", "neo-tree" },
    --     },
    --   },
    --   lualine_b = {},
    --   lualine_c = {},
    --   lualine_x = {},
    --   lualine_y = { { "tabs", mode = 1 } },
    --   lualine_z = { "hostname" },
    -- },
    extensions = { "neo-tree", "quickfix" },
  })
end

return M
