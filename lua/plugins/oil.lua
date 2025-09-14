return {
  "stevearc/oil.nvim",
  event = "VeryLazy",

  keys = {
    { "<A-.>", "<CMD>Oil<CR>", desc = "Oil [oil]" },
  },

  --- @module "oil"
  --- @type oil.SetupOpts
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
      ["-"] = "actions.parent",
      ["<C-c>"] = "actions.close",
      ["<C-p>"] = "actions.preview",
      ["<C-r>"] = "actions.refresh",
      ["<C-s>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
      ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
      ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
      ["<CR>"] = "actions.select",
      ["="] = { "<CMD>write<CR>", desc = "Save changes" },
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["g."] = "actions.toggle_hidden",
      ["g?"] = "actions.show_help",
      ["g\\"] = "actions.toggle_trash",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["H"] = "actions.parent",
      ["L"] = "actions.select",
      ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
    },
    skip_confirm_for_simple_edits = true,
    use_default_keymaps = false,
    view_options = {
      show_hidden = true,
    },
    watch_for_changes = true,
  },

  -- config = function(_, opts)
  --   require("oil").setup(opts)
  --
  --   vim.api.nvim_create_autocmd(
  --     { "User" },
  --     {
  --       pattern = { "OilEnter" },
  --       callback = vim.schedule_wrap(
  --         function(args)
  --           if vim.api.nvim_get_current_buf() == args.data.buf and require("oil").get_cursor_entry() then
  --             require("oil.actions").cd.callback({ silent = true })
  --           end
  --         end
  --       ),
  --     }
  --   )
  -- end,
}
