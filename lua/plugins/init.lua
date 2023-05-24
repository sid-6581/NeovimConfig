return {
  "folke/lazy.nvim",

  -- Libraries used by other plugins
  { "MunifTanjim/nui.nvim", lazy = true },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- File types
  { "isobit/vim-caddyfile", event = "VeryLazy" },
  { "mechatroner/rainbow_csv", ft = "csv" },
  { "vmware-archive/salt-vim", event = "VeryLazy" },

  { "kevinhwang91/nvim-bqf", event = "VeryLazy" },
  { "moll/vim-bbye", event = "VeryLazy" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "nmac427/guess-indent.nvim", event = "VeryLazy", opts = {} },
  { "norcalli/nvim-colorizer.lua", event = "VeryLazy", config = function() require("colorizer").setup() end },
  { "tiagovla/scope.nvim", event = "VeryLazy", opts = {} },
  { "lambdalisue/suda.vim", event = "VeryLazy", init = function() vim.g.suda_smart_edit = 1 end },

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
        fg_color = colors.bright_yellow,
        other_win_hl_color = colors.dark1,
        selection_display = function(char) return "  " .. char .. "  " end,
      })
    end,
  },
}
