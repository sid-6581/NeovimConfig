return {
  "OXY2DEV/markview.nvim",
  event = "VeryLazy",
  ft = "markdown",

  keys = {
    { "<Leader>um", "<CMD>Markview toggleAll<CR>", desc = "Toggle markview (global) [markview]" },
  },

  opts = {
    modes = { "n", "i", "no", "c" },
    hybrid_modes = { "n", "i" },

    headings = {
      shift_width = 0,
      heading_1 = {
        icon = "󰉫 ",
      },
      heading_2 = {
        icon = "󰉬 ",
      },
      heading_3 = {
        icon = "󰉭 ",
      },
      heading_4 = {
        icon = "󰉮 ",
      },
      heading_5 = {
        icon = "󰉯 ",
      },
      heading_6 = {
        icon = "󰉰 ",
      },
    },
  },
}
