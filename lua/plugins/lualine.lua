return {
  "nvim-lualine/lualine.nvim",
  event = {
    "StdinReadPost",
    "BufRead",
    "BufNewFile",
    { event = "User", pattern = "SnacksDashboardClosed" },
  },

  config = function()
    local lualine = require("lualine")

    local custom_theme = vim.deepcopy(require("lualine.themes.gruvbox_dark"))
    custom_theme.normal.c.bg = "Normal"
    custom_theme.insert.c = custom_theme.normal.c
    custom_theme.visual.c = custom_theme.normal.c
    custom_theme.command.c = custom_theme.normal.c
    custom_theme.replace.c = custom_theme.normal.c
    custom_theme.inactive.c = custom_theme.normal.c

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = custom_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            "branch",
            icons_enabled = true,
            icon = "",
          },
        },
        lualine_b = {
          "cwd",
          {
            "filename",
            newfile_status = true,
            path = 1,
            symbols = {
              modified = "●",
              readonly = "",
            },
          },
        },
        lualine_c = {
          "aerial",
        },
        lualine_x = {
          {
            require("noice").api.status.mode["get"],
            cond = require("noice").api.status.mode["has"],
            color = { fg = "#ff9e64" },
          },
          {
            "diff",
            colored = true,
            symbols = { added = " ", modified = " ", removed = " " },
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic", "nvim_lsp" },
            sections = { "error", "warn", "info", "hint" },
            symbols = {
              error = " ",
              hint = " ",
              info = " ",
              warn = " ",
            },
            colored = true,
            update_in_insert = true,
            always_visible = false,
          },
          "filetype",
          function() return vim.api.nvim_get_option_value("buftype", { scope = "local" }) end,
          "lsp",
          function() return vim.api.nvim_get_option_value("shiftwidth", { scope = "local" }) .. " spaces" end,
          "encoding",
          {
            "fileformat",
            symbols = {
              unix = "lf",
              dos = "crlf",
              mac = "cr",
            },
          },
        },
        lualine_y = { "location", "selectioncount" },
        lualine_z = {
          "progress",
          {
            "mode",
            fmt = function(str) return str:sub(1, 1) end,
          },
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = { "filename" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },

      tabline = {
        lualine_a = {
          {
            "buffers",
            show_filename_only = true,
            filetype_names = {
              ["neo-tree"] = "neo-tree",
              ["oil"] = "oil",
            },
            symbols = {
              alternate_file = "",
            },
            use_mode_colors = true,
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_z = {
          {
            "tabs",
            cond = function() return #vim.api.nvim_list_tabpages() > 1 end,
            mode = 1,
            symbols = {
              modified = "●",
            },
          },
        },
      },
    })
  end,
}
