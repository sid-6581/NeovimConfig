return {
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "nvim-tree/nvim-web-devicons",

  {
    "folke/lazy.nvim",
  },

  {
    "vmware-archive/salt-vim",
    ft = "sls",
  },

  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  {
    "gpanders/editorconfig.nvim",
    event = { "BufReadPost", "InsertEnter" },
  },

  {
    "isobit/vim-caddyfile",
    event = { "BufReadPost", "InsertEnter" },
  },

  {
    "mechatroner/rainbow_csv",
    ft = "csv",
  },

  {
    "moll/vim-bbye",
    cmd = "Bdelete",
  },

  {
    "nmac427/guess-indent.nvim",
    event = "BufReadPost",
    config = true,
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = "FileType",
    config = true,
  },

  {
    "lambdalisue/suda.vim",
    event = "BufReadPre",
    cmd = { "SudaRead", "SudaWrite" },

    init = function()
      vim.g.suda_smart_edit = 1
    end,
  },

  {
    "s1n7ax/nvim-window-picker",

    config = function()
      local colors = require("gruvbox.palette").colors

      require("nvim-window-picker").setup({
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
