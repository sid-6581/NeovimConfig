return {
  "akinsho/nvim-bufferline.lua",
  lazy = false,
  priority = 997,

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

    local colors = require("gruvbox.palette")

    require("bufferline").setup({
      highlights = {
        tab_selected = {
          bg = colors.dark1,
          fg = colors.light1,
        },
        buffer_selected = {
          bg = colors.dark1,
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
