return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "main",
  cmd = "Neotree",

  config = function()
    vim.g.neo_tree_remove_legacy_commands = 1

    vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { link = "Title" })

    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "single",
      use_popups_for_input = false,
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
  end,
}
