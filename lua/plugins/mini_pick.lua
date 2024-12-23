local make_scroll_half_page = function(direction)
  local scroll_key = direction == "down" and "<C-d>" or "<C-u>"
  scroll_key = vim.api.nvim_replace_termcodes(scroll_key, true, true, true)
  local scroll_fun = function(win_id)
    vim.api.nvim_win_call(win_id, function() vim.cmd("normal! " .. scroll_key) end)
  end

  return function()
    local pick = require("mini.pick")
    local win_id = pick.get_picker_state().windows.main
    local is_not_main_view = vim.api.nvim_get_current_buf() ~= pick.get_picker_state().buffers.main
    if is_not_main_view then return scroll_fun(win_id) end

    local n_scroll = math.floor(0.5 * vim.api.nvim_win_get_height(win_id))
    local mappings = pick.get_picker_opts().mappings
    local move_key = direction == "down" and mappings.move_down or mappings.move_up
    for _ = 1, n_scroll do
      vim.api.nvim_input(move_key)
    end
  end
end

return {
  "echasnovski/mini.pick",

  keys = {
    {
      "<C-.>",
      function()
        require("mini.pick").builtin.cli({
            command = {
              "fd",
              "--hidden",
              "--exclude",
              ".git",
              "--exclude",
              "node_modules",
            },
          },
          {
            source = {
              name = "Files (fd)",
              show = function(buf_id, items, query)
                require("mini.pick").default_show(buf_id, items, query, { show_icons = true })
              end,
            },
          }
        )
      end,
      desc = "Files [mini.pick]",
    },
  },

  opts = {
    mappings = {
      caret_left = "<Left>",
      caret_right = "<Right>",
      choose = "<CR>",
      choose_in_split = "<C-s>",
      choose_in_tabpage = "",
      choose_in_vsplit = "<C-v>",
      choose_marked = "<M-CR>",
      delete_char = "<BS>",
      delete_char_right = "<Del>",
      delete_left = "",
      delete_word = "<C-BS>",
      mark = "<C-x>",
      mark_all = "<C-a>",
      move_down = "<C-j>",
      move_start = "<C-g>",
      move_up = "<C-k>",
      paste = "<C-r>",
      refine = "<C-Space>",
      refine_marked = "<M-Space>",
      scroll_down = "<C-f>",
      scroll_down_half = { char = "<C-d>", func = make_scroll_half_page("down") },
      scroll_left = "<C-h>",
      scroll_right = "<C-l>",
      scroll_up = "<C-b>",
      scroll_up_half = { char = "<C-u>", func = make_scroll_half_page("up") },
      stop = "<Esc>",
      toggle_info = "<F1>",
      toggle_preview = "<C-p>",

      to_quickfix = {
        char = "<C-q>",
        func = function()
          local pick = require("mini.pick")
          local items = pick.get_picker_matches().all or {}
          pick.default_choose_marked(items)
          return true
        end,
      },

      choose_in_tabpage_fixed = {
        char = "<C-t>",
        func = function()
          local pick = require("mini.pick")
          local cur_item = pick.get_picker_matches().current
          if cur_item == nil then
            return true
          end

          vim.cmd.tabnew(cur_item)
          pick.set_picker_target_window(vim.api.nvim_get_current_win())
          pick.stop()
          return true
        end,
      },
    },

    window = {
      config = function()
        local height = math.floor(0.65 * vim.o.lines)
        local width = math.floor(0.65 * vim.o.columns)
        return {
          border = "rounded",
          anchor = "NW",
          height = height,
          width = width,
          row = math.floor(0.5 * (vim.o.lines - height)),
          col = math.floor(0.5 * (vim.o.columns - width)),
        }
      end,
    },
  },

  config = function(_, opts)
    require("mini.pick").setup(opts)
    vim.api.nvim_set_hl(0, "MiniPickMatchRanges", { reverse = true })
    vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { link = "CursorLine" })
  end,
}
