return {
  "OXY2DEV/markview.nvim",
  event = "VeryLazy",

  opts = {
    -- modes = { "n", "no" },
    hybrid_modes = { "n" },

    callbacks = {
      on_enable = function(_, win)
        vim.wo[win].conceallevel = 2
        vim.wo[win].concealcursor = "c"
      end,
    },
  },

  config = function(_, opts)
    require("markview").setup(opts)
    vim.o.conceallevel = 0
    vim.o.concealcursor = ""
  end,
}
