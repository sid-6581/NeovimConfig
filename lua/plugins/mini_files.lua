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
      go_out = "",
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
        local map_open = function(lhs, cmd, desc)
          local rhs = function()
            local new_target_window = vim.api.nvim_win_call(
              require("mini.files").get_explorer_state().target_window or 0,
              function()
                vim.cmd(cmd)
                return vim.api.nvim_get_current_win()
              end
            )

            require("mini.files").set_target_window(new_target_window)
            require("mini.files").go_in({ close_on_file = true })
          end

          vim.keymap.set("n", lhs, rhs, { buffer = args.data.buf_id, desc = desc })
        end

        map_open("<C-s>", "split", "Open in horizontal split [mini.files]")
        map_open("<C-v>", "vsplit", "Open in vertical split [mini.files]")

        vim.keymap.set(
          "n",
          "<Esc>",
          function() require("mini.files").close() end,
          { buffer = args.data.buf_id, desc = "Close [mini.files]" }
        )

        vim.keymap.set(
          "n",
          "h",
          function()
            local _, col = unpack(vim.api.nvim_win_get_cursor(0))
            vim.notify(vim.inspect(col))
            if col <= 10 then
              require("mini.files").go_out()
            else
              vim.cmd.normal({ "h", bang = true })
            end
          end,
          { buffer = args.data.buf_id, desc = "Go out [mini.files]" }
        )
      end,
    })

    -- vim.api.nvim_create_autocmd("User", {
    --   pattern = "MiniFilesWindowUpdate",
    --
    --   callback = function(args)
    --     local config = vim.api.nvim_win_get_config(args.data.win_id)
    --     config.height = vim.o.lines - 4 - vim.o.cmdheight
    --
    --     if config.width == 100 then
    --       config.width = vim.o.columns - 2 - config.col
    --     end
    --
    --     if config.title[#config.title][1] ~= " " then
    --       table.insert(config.title, { " ", "NormalFloat" })
    --     end
    --
    --     if config.title[1][1] ~= " " then
    --       table.insert(config.title, 1, { " ", "NormalFloat" })
    --     end
    --
    --     vim.api.nvim_win_set_config(args.data.win_id, config)
    --   end,
    -- })
  end,
}
