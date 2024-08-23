return {
  "echasnovski/mini.pick",

  opts = {
    mappings = {
      caret_left = "<Left>",
      caret_right = "<Right>",

      choose = "<CR>",
      choose_in_split = "<C-s>",
      choose_in_tabpage = "<C-t>",
      choose_in_vsplit = "<C-v>",
      choose_marked = "<M-CR>",

      delete_char = "<BS>",
      delete_char_right = "<Del>",
      delete_left = "<C-u>",
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
      scroll_left = "<C-h>",
      scroll_right = "<C-l>",
      scroll_up = "<C-b>",

      stop = "<Esc>",

      toggle_info = "<F1>",
      toggle_preview = "<C-p>",
    },

    window = {
      config = function()
        local height = math.floor(0.618 * vim.o.lines)
        local width = math.floor(0.618 * vim.o.columns)
        return {
          anchor = "NW",
          height = height,
          width = width,
          row = math.floor(0.5 * (vim.o.lines - height)),
          col = math.floor(0.5 * (vim.o.columns - width)),
        }
      end,
    },
  },
}
