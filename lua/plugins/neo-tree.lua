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
    use_popups_for_input = false,
    window = {
      mappings = {
        ["<C-p>"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        ["<C-s>"] = "open_split",
        ["<C-t>"] = "open_tabnew",
        ["<C-v>"] = "open_vsplit",
        ["<Space>"] = "none",
        ["C"] = "none",
        ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        ["h"] = "close_node",
        ["l"] = "open",
        ["z"] = "none",
        ["zM"] = "close_all_nodes",
        ["zR"] = "expand_all_nodes",
        ["zc"] = "close_node",
      },
      width = 40,
    },
    filesystem = {
      window = {
        mappings = {
          ["-"] = "navigate_up",
          ["/"] = "none",
          ["F"] = "fuzzy_finder",
        },
        width = 40,
      },
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
