return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",

  config = {
    input = {
      border = "single",
      insert_only = false,
      start_in_insert = false,
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
