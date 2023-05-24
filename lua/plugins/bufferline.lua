return {
  "akinsho/nvim-bufferline.lua",
  lazy = false,
  priority = 998,

  config = function()
    local signs = require("plugins.lsp.diagnostics").signs

    signs = {
      error = signs.Error,
      warning = signs.Warn,
      info = signs.Info,
      hint = signs.Hint,
    }

    local severities = {
      "error",
      "warning",
      -- "info",
      -- "hint",
    }

    local colors = require("gruvbox.palette").colors

    require("bufferline").setup({
      highlights = {
        fill = {
          bg = colors.dark0_hard,
        },

        background = {
          bg = colors.dark0_hard,
          fg = colors.dark3,
          italic = true,
        },
        close_button = {
          bg = colors.dark0_hard,
        },

        tab = {
          bg = colors.dark0,
          fg = colors.light2,
        },
        tab_selected = {
          bg = colors.dark1,
          fg = colors.light1,
        },
        tab_close = {
          bg = colors.dark0_hard,
          fg = colors.light4,
        },

        buffer_visible = {
          bg = colors.dark0,
          italic = true,
        },
        close_button_visible = {
          bg = colors.dark0,
        },
        numbers_visible = {
          bg = colors.dark0,
        },
        diagnostic_visible = {
          bg = colors.dark0,
        },
        hint_visible = {
          bg = colors.dark0,
        },
        hint_diagnostic_visible = {
          bg = colors.dark0,
        },
        info_visible = {
          bg = colors.dark0,
        },
        info_diagnostic_visible = {
          bg = colors.dark0,
        },
        warning_visible = {
          bg = colors.dark0,
        },
        warning_diagnostic_visible = {
          bg = colors.dark0,
        },
        error_visible = {
          bg = colors.dark0,
        },
        error_diagnostic_visible = {
          bg = colors.dark0,
        },
        modified_visible = {
          bg = colors.dark0,
        },
        duplicate_visible = {
          bg = colors.dark0,
        },
        indicator_visible = {
          fg = colors.dark0,
          bg = colors.dark0,
        },

        buffer_selected = {
          bg = colors.dark1,
          bold = false,
          italic = false,
        },
        close_button_selected = {
          bg = colors.dark1,
        },
        numbers_selected = {
          bg = colors.dark1,
        },
        diagnostic_selected = {
          bg = colors.dark1,
        },
        hint_selected = {
          bg = colors.dark1,
        },
        hint_diagnostic_selected = {
          bg = colors.dark1,
        },
        info_selected = {
          bg = colors.dark1,
        },
        info_diagnostic_selected = {
          bg = colors.dark1,
        },
        warning_selected = {
          bg = colors.dark1,
        },
        warning_diagnostic_selected = {
          bg = colors.dark1,
        },
        error_selected = {
          bg = colors.dark1,
        },
        error_diagnostic_selected = {
          bg = colors.dark1,
        },
        modified_selected = {
          bg = colors.dark1,
        },
        duplicate_selected = {
          bg = colors.dark1,
        },
        indicator_selected = {
          fg = colors.dark1,
          bg = colors.dark1,
        },
      },

      options = {
        separator_style = "thin",
        diagnostics = "nvim_lsp",
        max_name_length = 48,

        diagnostics_indicator = function(_, _, diag)
          local s = {}
          for _, severity in ipairs(severities) do
            if diag[severity] then table.insert(s, signs[severity] .. diag[severity]) end
          end
          return table.concat(s, " ")
        end,

        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Title",
            text_align = "center",
          },
        },
      },
    })
  end,
}
