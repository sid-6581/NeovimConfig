return {
  "stevearc/oil.nvim",
  event = "VeryLazy",

  keys = {
    { "<Space>.", "<CMD>Oil<CR>", desc = "Open Oil [oil]" },
    { "<A-.>", "<CMD>Oil --float<CR>", desc = "Open Oil in a float [oil]" },
  },

  --- @module "oil"
  --- @type oil.SetupOpts
  opts = {
    buf_options = {
      buflisted = true,
      bufhidden = "wipe",
    },

    case_insensitive = true,

    columns = {
      "permissions",
      "size",
      "mtime",
      "icon",
    },

    constrain_cursor = "name",
    default_file_explorer = true,

    float = {
      border = "rounded",
      max_height = 0.9,
      max_width = 0.9,
    },

    keymaps = {
      ["-"] = "actions.parent",
      ["<A-.>"] = "actions.close",
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
      ["h"] = { "actions.parent", mode = "n" },
      ["l"] = { "actions.select", mode = "n" },
      ["H"] = { "h", desc = "Cursor left" },
      ["L"] = { "l", desc = "Cursor right" },
      ["<A-h>"] = { "h", desc = "Cursor left" },
      ["<A-l>"] = { "l", desc = "Cursor right" },
      ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
    },

    skip_confirm_for_simple_edits = true,
    use_default_keymaps = false,

    view_options = {
      is_always_hidden = function(name, _bufnr)
        if name == ".." then
          return true
        end

        return false
      end,

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
