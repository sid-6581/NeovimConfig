return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",

  keys = {
    {
      "<A-1>",
      function()
        require("neo-tree.command").execute({
          action = "focus",
          source = "filesystem",
          position = "left",
          toggle = true,
          reveal_force_cwd = true,
          dir = vim.fn.getcwd(),
        })
      end,
      -- "<CMD>Neotree toggle left reveal_force_cwd<CR>",
      desc = "File explorer [neo-tree]",
    },
    { "<A-2>", "<CMD>Neotree toggle left show buffers<CR>", desc = "Buffer explorer [neo-tree]" },
    { "<A-3>", "<CMD>Neotree toggle left show git_status<CR>", desc = "Git explorer [neo-tree]" },
  },

  opts = {
    close_if_last_window = true,
    enable_cursor_hijack = true,
    popup_border_style = "single",
    use_popups_for_input = false,
    window = {
      mappings = {
        ["Z"] = "expand_all_nodes",
        ["<C-S>"] = "open_split",
        ["<C-V>"] = "open_vsplit",
        ["<C-T>"] = "open_tabnew",
      },
      width = 40,
    },
    filesystem = {
      window = {
        mappings = {
          ["/"] = "none",
          ["F"] = "fuzzy_finder",
        },
        width = 40,
      },
      hijack_netrw_behavior = "open_default",
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
