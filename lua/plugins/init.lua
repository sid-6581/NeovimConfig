return {
  "folke/lazy.nvim",
  "gpanders/editorconfig.nvim",
  "isobit/vim-caddyfile",
  "kevinhwang91/nvim-bqf",
  "mechatroner/rainbow_csv",
  "moll/vim-bbye",
  "MunifTanjim/nui.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "vmware-archive/salt-vim",

  {
    "nmac427/guess-indent.nvim",
    config = true,
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = true,
  },

  {
    "lambdalisue/suda.vim",

    init = function()
      vim.g.suda_smart_edit = 1
    end,
  },

  {
    "s1n7ax/nvim-window-picker",

    config = function()
      local colors = require("gruvbox.palette").colors

      require("window-picker").setup({
        fg_color = colors.bright_yellow,
        other_win_hl_color = colors.dark1,
        selection_display = function(char)
          return "  " .. char .. "  "
        end,
      })
    end,
  },

  {
    "tiagovla/scope.nvim",
    config = true,
  },
}
