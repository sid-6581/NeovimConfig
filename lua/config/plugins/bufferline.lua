return {
  "akinsho/nvim-bufferline.lua",
  lazy = false,
  priority = 997,

  config = function()
    local signs = require("config.plugins.lsp.handlers").signs

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

    require("bufferline").setup({
      options = {
        separator_style = "thick",
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

        highlights = {
          tab = {
            bg = "#ffffff",
          },
        },
      },
    })
  end,
}
