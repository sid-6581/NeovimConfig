return {
  "nvim-lualine/lualine.nvim",
  priority = 999,

  config = function()
    local lualine = require("lualine")
    local noice = require("noice")
    local navic = require("nvim-navic")

    local custom_theme = vim.deepcopy(require("lualine.themes.gruvbox_dark"))
    custom_theme.normal.c.bg = "Normal"
    custom_theme.insert.c = custom_theme.normal.c
    custom_theme.visual.c = custom_theme.normal.c
    custom_theme.command.c = custom_theme.normal.c
    custom_theme.replace.c = custom_theme.normal.c
    custom_theme.inactive.c = custom_theme.normal.c

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

    local spaces = function() return vim.api.nvim_get_option_value("shiftwidth", { scope = "local" }) .. " spaces" end

    local lsp = {
      function()
        local msg = "-"
        local buf_ft = vim.api.nvim_get_option_value("filetype", { scope = "local" })
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
          {
            "navic",
            color_correction = "dynamic",
            fmt = function(str) return str .. "%#NavicSeparator# %*" end,
            padding = {
              left = 1,
              right = 0,
            },
          },
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
        lualine_x = { diff, diagnostics, "filetype", lsp, spaces, "encoding", fileformat },
        lualine_y = { "location", "selectioncount" },
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

    require("lualine").refresh()
  end,
}
