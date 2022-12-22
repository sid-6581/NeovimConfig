local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "main",
}

function M.config()
  local neo_tree = require("neo-tree")

  vim.g.neo_tree_remove_legacy_commands = 1

  vim.cmd([[
    highlight link NeoTreeFloatBorder WinSeparator
    highlight link NeoTreeFloatTitle Title
  ]])

  neo_tree.setup({
    close_if_last_window = true,
    popup_border_style = "single",
    window = {
      width = 30,
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
      follow_current_file = true,
      group_empty_dirs = true,
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
    },
  })
end

return M