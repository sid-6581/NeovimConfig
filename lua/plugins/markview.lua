return {
  "OXY2DEV/markview.nvim",
  event = "VeryLazy",

  opts = {
    modes = { "n", "i", "no", "c" },
    hybrid_modes = { "i" },

    callbacks = {
      on_enable = function(_, win)
        vim.wo[win].conceallevel = 2
        vim.wo[win].concealcursor = "nc"
      end,
    },
  },
}
