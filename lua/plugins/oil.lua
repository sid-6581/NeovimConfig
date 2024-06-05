return {
  "stevearc/oil.nvim",
  event = "VeryLazy",

  opts = {
    default_file_explorer = false,
    columns = {
      "permissions",
      "size",
      "mtime",
      "icon",
    },
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 15,
      border = "single",
    },
    preview = {
      border = "single",
    },
    progress = {
      border = "single",
    },
  },
}
