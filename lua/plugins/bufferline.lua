---@diagnostic disable: missing-fields
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

    require("bufferline").setup({
      options = {
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
