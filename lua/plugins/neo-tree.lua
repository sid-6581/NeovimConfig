return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "main",
  event = "VeryLazy",

  keys = {
    { "<A-1>", "<CMD>Neotree toggle left reveal_force_cwd<CR>", desc = "File explorer" },
    { "<A-2>", "<CMD>Neotree toggle left show buffers<CR>", desc = "Buffer explorer" },
    { "<A-3>", "<CMD>Neotree toggle left show git_status<CR>", desc = "Git explorer" },
  },

  opts = {
    close_if_last_window = true,
    popup_border_style = "single",
    use_popups_for_input = false,
    window = {
      mappings = {
        ["Z"] = "expand_all_nodes",
      },
      width = 40,
    },
    filesystem = {
      hijack_netrw_behavior = "disabled",
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
        never_show = {
          ".git",
        },
      },
      bind_to_cwd = true,
      cwd_target = {
        sidebar = "none",
        current = "none",
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      group_empty_dirs = false,
    },
  },
}
