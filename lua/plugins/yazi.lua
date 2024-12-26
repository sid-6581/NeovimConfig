return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",

  keys = {
    {
      "<Leader>.",
      "<CMD>Yazi<CR>",
      desc = "Open yazi [yazi]",
    },
  },

  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<S-F1>",
      open_file_in_vertical_split = "<C-v>",
      open_file_in_horizontal_split = "<C-s>",
      open_file_in_tab = "<C-t>",
      grep_in_directory = "<C-f>",
      replace_in_directory = "<C-g>",
      cycle_open_buffers = "<Tab>",
      copy_relative_path_to_selected_files = "<C-y>",
      send_to_quickfix_list = "<C-q>",
      change_working_directory = "<C-\\>",
    },
  },
}
