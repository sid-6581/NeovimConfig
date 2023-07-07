return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "main",
  event = "VeryLazy",

  config = function()
    vim.g.neo_tree_remove_legacy_commands = 1

    vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { link = "Title" })

    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "single",
      use_popups_for_input = false,
      window = {
        width = 40,
      },
      filesystem = {
        use_libuv_file_watcher = false,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
        bind_to_cwd = true,
        follow_current_file = {
          enabled = true,
        },
        group_empty_dirs = false,
        hijack_netrw_behavior = "open_current",
      },
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem", display_name = " 󰉓 Files " },
          { source = "buffers", display_name = " 󱔗 Buffers " },
          { source = "git_status", display_name = " 󰊢 Git " },
        },
      },
      default_component_configs = {
        icon = {
          folder_empty = "",
          folder_empty_open = "",
        },
        git_status = {
          symbols = {
            renamed = "󰁕",
            unstaged = "󰄱",
          },
        },
      },
      document_symbols = {
        kinds = {
          File = { icon = "󰈙", hl = "Tag" },
          Namespace = { icon = "󰌗", hl = "Include" },
          Package = { icon = "󰏖", hl = "Label" },
          Class = { icon = "󰌗", hl = "Include" },
          Property = { icon = "󰆧", hl = "@property" },
          Enum = { icon = "󰒻", hl = "@number" },
          Function = { icon = "󰊕", hl = "Function" },
          String = { icon = "󰀬", hl = "String" },
          Number = { icon = "󰎠", hl = "Number" },
          Array = { icon = "󰅪", hl = "Type" },
          Object = { icon = "󰅩", hl = "Type" },
          Key = { icon = "󰌋", hl = "" },
          Struct = { icon = "󰌗", hl = "Type" },
          Operator = { icon = "󰆕", hl = "Operator" },
          TypeParameter = { icon = "󰊄", hl = "Type" },
          StaticMethod = { icon = "󰠄 ", hl = "Function" },
        },
      },
    })
  end,
}
