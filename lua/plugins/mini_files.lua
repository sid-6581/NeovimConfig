return {
  "echasnovski/mini.files",
  event = "VeryLazy",

  keys = {
    { "<leader>fm", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end, desc = "Open (file dir) [mini.files]" },
    { "<leader>fM", function() require("mini.files").open(vim.loop.cwd(), false) end, desc = "Open (cwd) [mini.files]" },
  },

  opts = {
    mappings = {
      go_in = "",
      go_in_plus = "<CR>",
      go_out = "H",
      go_out_plug = "",
      show_help = "?",
      synchronize = "=",
    },
    windows = {
      preview = true,
      width_focus = 50,
      width_preview = 100,
    },
    options = {
      use_as_default_explorer = false,
    },
  },

  config = function(_, opts)
    require("mini.files").setup(opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",

      callback = function(args)
        local buf_id = args.data.buf_id

        local open_with = function(lhs, cmd, desc)
          local rhs = function()
            local new_target_window
            vim.api.nvim_win_call(require("mini.files").get_explorer_state().target_window or 0, function()
              vim.cmd(cmd)
              new_target_window = vim.api.nvim_get_current_win()
            end)

            require("mini.files").set_target_window(new_target_window)
            require("mini.files").close()
          end

          vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
        end

        open_with("<C-S>", "split", "Open in horizontal split [mini.files]")
        open_with("<C-V>", "vsplit", "Open in vertical split [mini.files]")
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesWindowUpdate",

      callback = function(args)
        local config = vim.api.nvim_win_get_config(args.data.win_id)
        config.height = vim.o.lines - 4 - vim.o.cmdheight

        if config.width == 100 then
          config.width = vim.o.columns - 2 - config.col
        end

        if config.title[#config.title][1] ~= " " then
          table.insert(config.title, { " ", "NormalFloat" })
        end

        if config.title[1][1] ~= " " then
          table.insert(config.title, 1, { " ", "NormalFloat" })
        end

        vim.api.nvim_win_set_config(args.data.win_id, config)
      end,
    })
  end,
}
