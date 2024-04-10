return {
  {
    "MunifTanjim/nui.nvim",
    event = "VeryLazy",
  },

  {
    "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = function() require("plenary.path").path.sep = "/" end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },

  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",

    opts = {
      input = {
        border = "single",
        get_config = function(opts)
          return {
            insert_only = #(opts.default or "") == 0,
            start_in_insert = #(opts.default or "") == 0,
          }
        end,
      },
      select = {
        nui = {
          border = {
            style = "single",
          },
        },
        builtin = {
          border = "single",
        },
      },
    },
  },

  {
    "s1n7ax/nvim-window-picker",
    event = "VeryLazy",

    config = function()
      local colors = require("util.colors").colors

      require("window-picker").setup({
        highlights = {
          statusline = {
            focused = {
              fg = colors.bright_yellow,
              bg = colors.dark1,
              bold = true,
            },
            unfocused = {
              fg = colors.bright_yellow,
              bg = colors.dark1,
              bold = true,
            },
          },
          winbar = {
            focused = {
              fg = colors.bright_yellow,
              bg = colors.dark1,
              bold = true,
            },
            unfocused = {
              fg = colors.bright_yellow,
              bg = colors.dark1,
              bold = true,
            },
          },
        },
        picker_config = {
          statusline_winbar_picker = {
            selection_display = function(char) return "  " .. char .. "  " end,
          },
        },
      })
    end,
  },
}
