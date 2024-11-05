return {
  {
    "andymass/vim-matchup",
    event = "VeryLazy",

    init = function()
      vim.g.matchup_mouse_enabled = false
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",

    opts = {
      matchup = {
        enable = true,
        disable_virtual_text = true,
      },
    },
  },
}
