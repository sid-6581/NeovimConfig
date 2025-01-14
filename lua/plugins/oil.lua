return {
  "stevearc/oil.nvim",
  event = "VeryLazy",

  opts = {
    buf_options = {
      buflisted = true,
      bufhidden = "wipe",
    },
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
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
      ["<C-s>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
      ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
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
