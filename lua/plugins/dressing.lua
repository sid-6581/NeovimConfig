return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",

  config = {
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
}
