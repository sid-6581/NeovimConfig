return {
  "stevearc/oil.nvim",
  event = "VeryLazy",

  opts = {
    columns = {
      "permissions",
      "size",
      "mtime",
      "icon",
    },
    constrain_cursor = "name",
    default_file_explorer = true,
    float = {
      padding = 15,
    },
    keymaps = {
      ["<C-c>"] = "actions.close",
      ["<C-r>"] = "actions.refresh",
      ["<C-p>"] = "actions.preview",
      ["<C-s>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
      ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
      ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
      ["<CR>"] = "actions.select",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["g."] = "actions.toggle_hidden",
      ["g?"] = "actions.show_help",
      ["g\\"] = "actions.toggle_trash",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["h"] = {
        callback = function()
          require("oil.actions").preview.callback()
          require("oil.actions").parent.callback()
        end,
        desc = "Navigate to the parent path",
      },
      ["-"] = {
        callback = function()
          require("oil.actions").preview.callback()
          require("oil.actions").parent.callback()
        end,
        desc = "Navigate to the parent path",
      },
      ["l"] = "actions.select",
      ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
    },
    skip_confirm_for_simple_edits = true,
    use_default_keymaps = false,
    view_options = {
      show_hidden = true,
    },
    watch_for_changes = true,
  },

  config = function(_, opts)
    require("oil").setup(opts)

    vim.api.nvim_create_autocmd(
      { "User" },
      {
        pattern = { "OilEnter" },
        callback = vim.schedule_wrap(
          function(args)
            if vim.api.nvim_get_current_buf() == args.data.buf and require("oil").get_cursor_entry() then
              require("oil.actions").cd.callback({ silent = true })
              require("oil.actions").preview.callback()
            end
          end
        ),
      }
    )
  end,
}
