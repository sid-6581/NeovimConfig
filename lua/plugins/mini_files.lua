-- Open file in split.
local open_in = function(cmd)
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

-- Smart "go out" that lets the cursor move left normally if it's not on the
-- first character of the file name, otherwise calls go_out().
local smart_go_out = function()
  local _, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.cmd.normal({ "h", bang = true })
  require("mini.files").refresh()
  local _, new_col = unpack(vim.api.nvim_win_get_cursor(0))
  if col == new_col then
    require("mini.files").go_out()
  end
end

return {
  "echasnovski/mini.files",
  event = "VeryLazy",

  keys = {
    { "-", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end, desc = "Open (file dir) [mini.files]" },
    { "<Leader>fm", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end, desc = "Open (file dir) [mini.files]" },
    { "<Leader>fM", function() require("mini.files").open(vim.loop.cwd(), false) end, desc = "Open (cwd) [mini.files]" },
  },

  opts = {
    mappings = {
      go_in = "",
      go_in_plus = "<CR>",
      go_out = "-",
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

    vim.api.nvim_set_hl(0, "MiniFilesCursorLine", { link = "CursorLine" })

    vim.api.nvim_create_autocmd(
      { "User" },
      {
        pattern = "MiniFilesBufferCreate",

        callback = function(event)
          require("which-key").add({
            buffer = event.data.buf_id,
            { "<Esc>", function() require("mini.files").close() end, desc = "Close [mini.files]" },
            { "<C-s>", function() open_in("split") end, desc = "Open in horizontal split [mini.files]" },
            { "<C-v>", function() open_in("vsplit") end, desc = "Open in vertical split [mini.files]" },
            { "h", function() smart_go_out() end, desc = "Go out [mini.files]" },
          })
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
