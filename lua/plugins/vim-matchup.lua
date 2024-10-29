return {
  {
    "andymass/vim-matchup",
    event = "VeryLazy",

    config = function()
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
