return {
  "folke/lazy.nvim",

  -- Libraries used by other plugins
  { "MunifTanjim/nui.nvim", lazy = true },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- File types
  { "isobit/vim-caddyfile", ft = "caddyfile" },
  { "mechatroner/rainbow_csv", ft = "csv" },
  { "vmware-archive/salt-vim", ft = "sls" },

  { "kevinhwang91/nvim-bqf", event = "VeryLazy" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "nmac427/guess-indent.nvim", event = "VeryLazy", opts = {} },
  { "norcalli/nvim-colorizer.lua", event = "VeryLazy", config = function() require("colorizer").setup() end },
  { "tiagovla/scope.nvim", event = "VeryLazy", opts = {} },
  { "lambdalisue/suda.vim", event = "VeryLazy", init = function() vim.g.suda_smart_edit = 1 end },

  {
    "kazhala/close-buffers.nvim",
    event = "VeryLazy",
    opts = {
      filetype_ignore = { "neo-tree" },
      preserve_window_layout = { "this" },
    },
    config = function(_, opts) require("close_buffers").setup(opts) end,
  },

  {
    "wellle/targets.vim",
    event = "VeryLazy",
    init = function()
      vim.g.targets_seekRanges = "cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA"
    end,
  },

  {
    "folke/trouble.nvim",
    event = "VeryLazy",

    opts = {
      use_diagnostic_signs = true,
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",

    opts = {
      preview_config = {
        border = "single",
      },
    },
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
      local colors = require("gruvbox.palette").colors

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
