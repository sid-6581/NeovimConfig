return {
  {
    "folke/lazydev.nvim",
    event = "VeryLazy",

    opts = {
      library = {
        "luvit-meta/library",
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",

    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },

  {
    "Bilal2453/luvit-meta",
    lazy = true,
  },
}
