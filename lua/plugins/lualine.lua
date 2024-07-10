return {
  "nvim-lualine/lualine.nvim",
  priority = 999,

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
        refresh = {
          statusline = 100,
        },
      },
      sections = {
        lualine_a = {
          "hostname",
          {
            "branch",
            icons_enabled = true,
            icon = "",
          },
        },
        lualine_b = {
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
          {
            function()
              if vim.b["visual_multi"] then
                local ret = vim.api.nvim_exec2("call b:VM_Selection.Funcs.infoline()", { output = true })
                return string.match(ret.output, "M.*")
              else
                return ""
              end
            end,
          },
          {
            "aerial",
          },
        },
        lualine_x = {
          {
            "diff",
            colored = true,
            symbols = { added = " ", modified = " ", removed = " " },
          },
          {
            function()
              return vim.trim(vim.fn.execute("verbose pwd"))
            end,
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
          {
            function()
              local msg = "-"
              local buf_ft = vim.api.nvim_get_option_value("filetype", { scope = "local" })
              local clients = vim.lsp.get_clients()
              if next(clients) == nil then return msg end

              for _, client in ipairs(clients) do
                --- @diagnostic disable-next-line: undefined-field
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then return client.name end
              end

              return msg
            end,
            icon = "",
          },
          function() return vim.api.nvim_get_option_value("shiftwidth", { scope = "local" }) .. " spaces" end,
          function() return vim.api.nvim_get_option_value("buftype", { scope = "local" }) end,
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
      tabline = {
        lualine_a = {
          {
            "buffers",
            show_filename_only = false,
            filetype_names = {
              ["neo-tree"] = "neo-tree",
              ["oil"] = "oil",
            },
            disabled_buftypes = {
              "neo-tree",
              "prompt",
              "quickfix",
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

    require("lualine").refresh()
  end,
}
