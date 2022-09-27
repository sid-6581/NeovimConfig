local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
  return
end

vim.g.neo_tree_remove_legacy_commands = 1

vim.cmd([[
  highlight link NeoTreeFloatBorder WinSeparator
  highlight link NeoTreeFloatTitle Title
]])

neo_tree.setup({
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "single",
  default_component_configs = {
    git_status = {
      symbols = {
        -- Change type
        added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = "✖", -- this can only be used in the git_status source
        renamed = "", -- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored = "",
        unstaged = "",
        staged = "",
        conflict = "",
      },
    },
  },
  window = {
    width = 30,
  },
  filesystem = {
    filtered_items = {
      visible = true, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false, -- only works on Windows for hidden files/directories
    },
    follow_current_file = false, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    group_empty_dirs = true, -- when true, empty folders will be grouped together
    hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_current",  -- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
    -- instead of relying on nvim autocmd events.
  },
})
