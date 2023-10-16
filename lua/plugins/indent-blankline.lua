return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",

  opts = {
    debounce = 100,
    indent = {
      char = "▏",
    },
    scope = {
      show_start = false,
      show_end = false,
    },
  },
}
