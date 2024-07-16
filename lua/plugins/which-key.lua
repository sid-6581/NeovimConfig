return {
  "folke/which-key.nvim",
  priority = 1000,
  lazy = false,

  keys = {
    { mode = { "n", "v" }, "<S-F1>", "<CMD>WhichKey<CR>", desc = "Open [which-key]" },
  },

  opts = {
    preset = "helix",
    sort = { "order", "group", "alphanum", "mod" },
    delay = function(ctx)
      return ctx.plugin and 0 or 250
    end,
    win = {
      border = "single",
      height = { max = 0.90 },
      wo = { winblend = 0 },
    },
    icons = {
      separator = " ",
      group = "",
    },
    replace = {
      desc = {
        { "<Plug>%(?([^)]*)%)?", "%1" },
      },
    },
    spec = {
      { "<Leader>", group = "Leader" },
      { "<Leader><Tab>", group = "Tabs" },
      { "<Leader>b", group = "Buffers" },
      { "<Leader>c", group = "Code" },
      { "<Leader>d", group = "Debug" },
      { "<Leader>f", group = "Find" },
      { "<Leader>g", group = "Git" },
      { "<Leader>go", group = "Octo" },
      { "<Leader>l", group = "LSP" },
      { "<Leader>o", group = "Overseer" },
      { "<Leader>t", group = "Terminal" },
      { "<Leader>u", group = "UI/toggles" },
      { "<Leader>w", group = "Windows" },
      { "<Leader>x", group = "Diagnostics/quickfix" },
      { ",", group = "Misc" },
      { "[", group = "Previous" },
      { "]", group = "Next" },
      { "g", group = "Goto/operators" },
      { "gp", group = "Goto preview" },
      { "c", group = "Code", mode = { "o", "x" } },
      { "z", group = "Fold/scroll" },

      -- Normal mode
      {
        mode = "n",
        { "<Leader>L", "<CMD>Lazy sync<CR>", desc = "Open [lazy]" },
        { "<C-,>", "<CMD>:e $MYVIMRC<CR>", desc = "Edit configuration [keymaps]" },
        { "<Leader>q", "<CMD>qa<CR>", desc = "Quit all [keymaps]" },
        { "<BS>", '<CMD>noh | echon ""<CR>', desc = "Clear search highlighting [keymaps]" },
        { "<Esc>", '<CMD>noh | echon ""<CR><Esc>', desc = "Clear search highlighting [keymaps]" },
        { "<C-s>", "<CMD>w!<CR>", desc = "Save [keymaps]" },
        { "<C-g>", "2<C-g>", desc = "Print current file name [keymaps]" },

        -- Adding blank lines
        { "<Leader><Enter>", "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>k", desc = "Add blank line on current line [keymaps]" },
        { "[<Space>", "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>", desc = "Add blank line above [keymaps]" },
        { "]<Space>", "<CMD>put =repeat(nr2char(10), v:count1)|silent '[-<CR>", desc = "Add blank line below [keymaps]" },

        -- Better motions with word wrap on
        { "j", "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Line down [keymaps]" },
        { "k", "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Line up [keymaps]" },

        -- Center screen after scrolling
        { "<C-D>", "<C-D>zz", hidden = true, desc = "Scroll down and center [keymaps]" },
        { "<C-U>", "<C-U>zz", hidden = true, desc = "Scroll up and center [keymaps]" },
        { "<C-F>", "<C-F>zz", hidden = true, desc = "Page forwards and center [keymaps]" },
        { "<C-B>", "<C-B>zz", hidden = true, desc = "Page backwards and center [keymaps]" },

        -- Buffers
        { "q", function() require("util").close_window_or_buffer() end, desc = "Delete buffer and close window [keymaps]" },
        { "<S-h>", "<CMD>bprevious<CR>", desc = "Previous buffer [keymaps]" },
        { "<S-l>", "<CMD>bnext<CR>", desc = "Next buffer [keymaps]" },
        { "<Leader>bl", "<CMD>set buflisted<CR>", desc = "Make buffer listed [keymaps]" },
        { "<Leader>bu", "<CMD>set nobuflisted<CR>", desc = "Make buffer unlisted [keymaps]" },

        -- Window opening/closing
        { "<Leader>-", "<CMD>new<CR>", desc = "Open new file in split [keymaps]" },
        { "<Leader>.-", "<CMD>new %:h<CR>", desc = "Edit current directory in split [keymaps]" },
        { "<Leader>.\\", "<CMD>vnew %:h<CR>", desc = "Edit current directory in vsplit [keymaps]" },
        { "<Leader><Leader>-", "<CMD>split<CR>", desc = "Open current file in split [keymaps]" },
        { "<Leader><Leader>.", "<CMD>e %:h<CR>", desc = "Edit current directory [keymaps]" },
        { "<Leader><Leader>\\", "<CMD>vsplit<CR>", desc = "Open current file in vsplit [keymaps]" },
        { "<Leader>\\", "<CMD>vnew<CR>", desc = "Open new file in vsplit [keymaps]" },
        { "<Leader>wT", "<C-W>T", desc = "Open current window in new tab [keymaps]" },
        { "<Leader>w]", "<C-W>]", desc = "Go to identifier in split [keymaps]" },
        { "<Leader>wc", "<C-W>c", desc = "Close current window [keymaps]" },
        { "<Leader>wo", "<C-W>o", desc = "Make current window the only one [keymaps]" },
        { "<Leader>wq", "<C-W>q", desc = "Quit window [keymaps]" },
        { "<Leader>ws", "<C-W>s", desc = "Split window (horizontal) [keymaps]" },
        { "<Leader>wv", "<C-W>v", desc = "Split window (vertical) [keymaps]" },
        { "<Leader>wz", "<C-W>z", desc = "Close preview window [keymaps]" },
        { "<Leader>w}", "<C-W>}", desc = "Go to identifier in preview [keymaps]" },
        { "<Leader>wx", "<C-W>x", desc = "Exchange current window with next [keymaps]" },
        { "<Leader>wa", "<C-^>", desc = "Edit alternate buffer in current window [keymaps]" },
        { "<Leader>wA", "<C-W>^", desc = "Edit alternate buffer in split [keymaps]" },

        -- Window movements
        { "<C-h>", "<C-W>h", desc = "Left one window [keymaps]" },
        { "<C-j>", "<C-W>j", desc = "Up one window [keymaps]" },
        { "<C-k>", "<C-W>k", desc = "Down one window [keymaps]" },
        { "<C-l>", "<C-W>l", desc = "Right one window [keymaps]" },
        { "<Leader>wh", "<C-W>h", desc = "Left one window [keymaps]" },
        { "<Leader>wj", "<C-W>j", desc = "Up one window [keymaps]" },
        { "<Leader>wk", "<C-W>k", desc = "Down one window [keymaps]" },
        { "<Leader>wl", "<C-W>l", desc = "Right one window [keymaps]" },
        { "<Leader>wH", "<C-W>H", desc = "Move current window to left [keymaps]" },
        { "<Leader>wJ", "<C-W>J", desc = "Move current window to bottom [keymaps]" },
        { "<Leader>wK", "<C-W>K", desc = "Move current window to top [keymaps]" },
        { "<Leader>wL", "<C-W>L", desc = "Move current window to right [keymaps]" },
        { "<Leader>wR", "<C-W>R", desc = "Rotate windows upwards/leftwards [keymaps]" },
        { "<Leader>wW", "<C-W>W", desc = "Previous window [keymaps]" },
        { "<Leader>ww", "<C-W><C-W>", desc = "Next window [keymaps]" },
        { "<Leader>wr", "<C-W>r", desc = "Rotate windows downwards/rightwards [keymaps]" },

        -- Window size
        { "<Leader>w<Bar>", "<C-W><Bar>", desc = "Maximize window width [keymaps]" },
        { "<Leader>w=", "<C-W>=", desc = "Make windows equally high and wide [keymaps]" },
        { "<Leader>w_", "<C-W>_", desc = "Maximize window height [keymaps]" },
        { "<S-C-Down>", "<CMD>resize -2<CR>", desc = "Decrease window height [keymaps]" },
        { "<S-C-Left>", "<CMD>vertical resize -2<CR>", desc = "Decrease window width [keymaps]" },
        { "<S-C-Right>", "<CMD>vertical resize +2<CR>", desc = "Increase window width [keymaps]" },
        { "<S-C-Up>", "<CMD>resize +2<CR>", desc = "Increase window height [keymaps]" },
        { "<A-_>", "<CMD>resize -2<CR>", desc = "Decrease window height [keymaps]" },
        { "<A-<>", "<CMD>vertical resize -2<CR>", desc = "Decrease window width [keymaps]" },
        { "<A->>", "<CMD>vertical resize +2<CR>", desc = "Increase window width [keymaps]" },
        { "<A-+>", "<CMD>resize +2<CR>", desc = "Increase window height [keymaps]" },

        -- Tabs
        { "<C-S-h>", "gT", desc = "Previous tab [keymaps]" },
        { "<C-S-l>", "gt", desc = "Next tab [keymaps]" },
        { "<C-S-t>", "<CMD>tabnew<CR>", desc = "Open new tab [keymaps]" },
        { "<Leader><Tab><BS>", "<CMD>tabclose<CR>", desc = "Close tab [keymaps]" },
        { "<Leader><Tab><Tab>", "<CMD>tabnew<CR>", desc = "New tab [keymaps]" },
        { "<Leader><Tab>h", "<CMD>tabprevious<CR>", desc = "Previous tab [keymaps]" },
        { "<Leader><Tab>l", "<CMD>tabnext<CR>", desc = "Next tab [keymaps]" },
        { "<Leader><Tab>[", "<CMD>tabprevious<CR>", desc = "Previous tab [keymaps]" },
        { "<Leader><Tab>]", "<CMD>tabnext<CR>", desc = "Next tab [keymaps]" },
        { "<Leader><Tab>q", "<CMD>tabclose<CR>", desc = "Close tab [keymaps]" },

        -- Folds
        { "zff", function() require("util").close_text_object_folds("@function.outer") end, desc = "Close folds for functions [keymaps]" },
        { "zfc", function() require("util").close_text_object_folds("@class.outer") end, desc = "Close folds for classes [keymaps]" },
        { "z1", function() require("util").close_folds_with_level(1) end, desc = "Close folds with level 1 [keymaps]" },
        { "z2", function() require("util").close_folds_with_level(2) end, desc = "Close folds with level 2 [keymaps]" },
        { "z3", function() require("util").close_folds_with_level(3) end, desc = "Close folds with level 3 [keymaps]" },
        { "z4", function() require("util").close_folds_with_level(4) end, desc = "Close folds with level 4 [keymaps]" },

        -- Code
        { "<Leader>ci", function() vim.show_pos() end, desc = "Inspect under cursor [keymaps]" },
        { "<Leader>cI", function() vim.treesitter.inspect_tree() end, desc = "Inspect treesitter tree [keymaps]" },

        { ",.", "<C-U>", desc = "Scroll up [keymaps]" },
        { ",/", "<C-D>", desc = "Scroll down [keymaps]" },
        { ",[", "<C-T>", desc = "Pop tag from stack [keymaps]" },
        { ",]", "<C-]>", desc = "Jump to tag [keymaps]" },
        { ",cd", "<CMD>cd %:h<CR>", desc = "Change current working directory to current file directory [keymaps]" },
        { ",do", "<CMD>diffoff<CR>", desc = "Diff off [keymaps]" },
        { ",dt", "<CMD>diffthis<CR>", desc = "Diff this [keymaps]" },
        { ",du", "<CMD>diffupdate<CR>", desc = "Diff update [keymaps]" },
        { ",r", "<C-R>", desc = "Redo last change [keymaps]" },
        { ",vb", "<C-V>", desc = "Visual block mode [keymaps]" },
        { ",x12", "<CMD>%!x12pp<CR><CMD>set ft=x12<CR>", desc = "Format X12 file [keymaps]" },
        { ",cr", "<CMD>%!dos2unix<CR>", desc = "Convert line endings to CR [keymaps]" },

        -- Toggles
        { "<Leader>uC", function() require("util").toggle("cursorcolumn") end, desc = "Toggle cursorcolumn [keymaps]" },
        { "<Leader>uc", function() require("util").toggle("cursorline") end, desc = "Toggle cursorline [keymaps]" },
        {
          "<Leader>ud",
          function()
            local enabled = vim.diagnostic.is_enabled()
            vim.notify((enabled and "Disabled" or "Enabled") .. " diagnostics")
            vim.diagnostic.enable(not enabled)
          end,
          desc = "Toggle diagnostics",
        },
        { "<Leader>uw", function() require("util").toggle("wrap") end, desc = "Toggle wrap [keymaps]" },
        { "<Leader>ul", function() require("util").toggle_number() end, desc = "Toggle line numbers [keymaps]" },
        { "<Leader>ur", function() require("util").toggle("relativenumber") end, desc = "Toggle relative line numbers [keymaps]" },

        -- Yank/paste
        { "Y", "_y$", desc = "Yank line characters [keymaps]" },
        { ",P", '"+P', desc = "Paste from system clipboard [keymaps]" },
        { ",p", '"+p', desc = "Paste from system clipboard [keymaps]" },
        { "<Leader>Pb", 'i <C-R>" <Esc>', desc = "Paste before cursor and add space at both ends [keymaps]" },
        { "<Leader>Pe", 'i<C-R>" <Esc>', desc = "Paste before cursor and add space at end [keymaps]" },
        { "<Leader>Ps", 'i <C-R>"<Esc>', desc = "Paste before cursor and add space at start [keymaps]" },
        { "<Leader>pb", 'a <C-R>" <Esc>', desc = "Paste after cursor and add space at both ends [keymaps]" },
        { "<Leader>pe", 'a<C-R>" <Esc>', desc = "Paste after cursor and add space at end [keymaps]" },
        { "<Leader>ps", 'a <C-R>"<Esc>', desc = "Paste after cursor and add space at start [keymaps]" },
        { "<S-Insert>", '"+P', desc = "Paste from system clipboard [keymaps]" },

        -- Motions
        { "b", "<CMD>call search('\\<', 'b')<CR>", desc = "Previous word [keymaps]" },
        { "e", "<CMD>call search('\\>')<CR>", desc = "Next end of word [keymaps]" },
        { "ge", "<CMD>call search('\\>', 'b')<CR>", desc = "Previous end of word [keymaps]" },
        { "w", "<CMD>call search('\\<')<CR>", desc = "Next word [keymaps]" },
        { "{", "[{", desc = "Previous unmatched { [keymaps]" },
        { "}", "]}", desc = "Next unmatched } [keymaps]" },
        { "(", "[(", desc = "Previous unmatched ( [keymaps]" },
        { ")", "])", desc = "Next unmatched ) [keymaps]" },

        -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
        { "n", "'Nn'[v:searchforward].'zv'", expr = true, desc = "Next search result [keymaps]" },
        { mode = "x", "n", "'Nn'[v:searchforward]", expr = true, desc = "Next search result [keymaps]" },
        { mode = "o", "n", "'Nn'[v:searchforward]", expr = true, desc = "Next search result [keymaps]" },
        { "N", "'nN'[v:searchforward].'zv'", expr = true, desc = "Previous search result [keymaps]" },
        { mode = "x", "N", "'nN'[v:searchforward]", expr = true, desc = "Previous search result [keymaps]" },
        { mode = "o", "N", "'nN'[v:searchforward]", expr = true, desc = "Previous search result [keymaps]" },
      },

      -- Insert mode
      {
        mode = "i",
        { "<C-s>", "<C-\\><C-o><CMD>w!<CR>", desc = "Save [keymaps]" },
        { "<A-BS>", "<C-\\><C-o>dB", desc = "Delete until the previous space [keymaps]" },
        { "<A-h>", "<Left>", noremap = false, desc = "Left [keymaps]" },
        { "<A-j>", "<Down>", noremap = false, desc = "Down [keymaps]" },
        { "<A-k>", "<Up>", noremap = false, desc = "Up [keymaps]" },
        { "<A-l>", "<Right>", noremap = false, desc = "Right [keymaps]" },
        { "<C-BS>", "<C-w>", desc = "Delete previous word [keymaps]" },
        { "<C-Enter>", "<Esc>m`o<Esc>``a", desc = "Insert blank line below [keymaps]" },
        { "<C-S-Enter>", "<Esc>m`O<Esc>``a", desc = "Insert blank line above [keymaps]" },
        { "<Esc>", "<Esc>`^", desc = "Exit insert mode [keymaps]" },
        { "<S-Insert>", "<C-r><C-o>+", desc = "Paste from system clipboard [keymaps]" },
        { "<S-Tab>", "<C-d>", desc = "Unindent line [keymaps]" },
      },

      -- Visual and select mode
      {
        mode = "v",
        { ",y", '"+y', desc = "Yank to system clipboard [keymaps]" },
        { "<C-Insert>", '"+y', desc = "Yank to system clipboard [keymaps]" },
        { "<Leader>sl", ":sort i<CR>", desc = "Sort lines [keymaps]" },
        { "<Leader>sn", ":sort in<CR>", desc = "Sort lines by number [keymaps]" },
        { "<Leader>su", ":sort iu<CR>", desc = "Sort lines unique [keymaps]" },
        { "<S-Insert>", '"+P', desc = "Paste from system clipboard [keymaps]" },
        { "<lt>", "<lt>gv", desc = "Decrease indent [keymaps]" },
        { ">", ">gv", desc = "Increase indent [keymaps]" },
        { "p", '"_dP', desc = "Paste [keymaps]" },
        { ",.", "<C-U>", desc = "Scroll up [keymaps]" },
        { ",/", "<C-D>", desc = "Scroll down [keymaps]" },
      },

      -- Terminal mode
      {
        mode = "t",
        { "<C-h>", "<C-\\><C-N><C-w>h", desc = "Left [keymaps]" },
        { "<C-j>", "<C-\\><C-N><C-w>j", desc = "Down [keymaps]" },
        { "<C-k>", "<C-\\><C-N><C-w>k", desc = "Up [keymaps]" },
        { "<C-l>", "<C-\\><C-N><C-w>l", desc = "Right [keymaps]" },
        { "<S-Enter>", "<Enter>", desc = "Insert enter [keymaps]" },
        { "<S-Esc>", "<C-\\><C-N>", desc = "Go to normal mode [keymaps]" },
        { "<S-Insert>", '<C-\\><C-N>"+pi', desc = "Paste from system clipboard [keymaps]" },
        { "<S-Space>", "<Space>", desc = "Insert space [keymaps]" },
      },

      -- Cmdline mode
      {
        mode = "c",
        { "<S-Insert>", "<C-R><C-R>+", desc = "Paste from system clipboard [keymaps]", silent = false },
        { "<C-BS>", "<C-w>", desc = "Delete previous word [keymaps]", silent = false },
        {
          "<C-j>",
          function() return vim.fn.wildmenumode() == 1 and "<C-n>" or "<C-j>" end,
          expr = true,
          desc = "Wildmenu down [keymaps]",
          silent = false,
        },
        {
          "<C-k>",
          function() return vim.fn.wildmenumode() == 1 and "<C-p>" or "<C-k>" end,
          expr = true,
          desc = "Wildmenu up [keymaps]",
          silent = false,
        },
      },
    },
  },
}
