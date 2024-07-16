require("which-key").add({
  { mode = { "n", "v" }, "<S-F1>", "<CMD>WhichKey<CR>", desc = "Show keys" },

  -- Normal mode
  {
    mode = "n",
    { "<C-,>", "<CMD>:e $MYVIMRC<CR>", desc = "Edit configuration" },
    { "<Leader>q", "<CMD>qa<CR>", desc = "Quit all" },
    { "<BS>", '<CMD>noh | echon ""<CR>', desc = "Clear search highlighting" },
    { "<Esc>", '<CMD>noh | echon ""<CR><Esc>', desc = "Clear search highlighting" },
    { "<C-s>", "<CMD>w!<CR>", desc = "Save" },
    -- "!", '"=nr2char(getchar())<CR>P',  desc = "Insert one character"  },

    -- Adding blank lines
    { "<Leader><Enter>", "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>k", desc = "Add blank line on current line" },
    { "[<Space>", "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>", desc = "Add blank line above" },
    { "]<Space>", "<CMD>put =repeat(nr2char(10), v:count1)|silent '[-<CR>", desc = "Add blank line below" },

    -- Better motions with word wrap on
    { "j", "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Line down" },
    { "k", "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Line up" },

    -- Center screen after scrolling
    { "<C-D>", "<C-D>zz", desc = "Scroll down and center" },
    { "<C-U>", "<C-U>zz", desc = "Scroll up and center" },
    { "<C-F>", "<C-F>zz", desc = "Page forwards and center" },
    { "<C-B>", "<C-B>zz", desc = "Page backwards and center" },

    -- Buffers
    { "q", function() require("util").close_window_or_buffer() end, desc = "Delete buffer and close window" },
    { "<S-h>", "<CMD>bprevious<CR>", desc = "Previous buffer" },
    { "<S-l>", "<CMD>bnext<CR>", desc = "Next buffer" },
    { "<Leader>bl", "<CMD>set buflisted<CR>", desc = "Make buffer listed" },
    { "<Leader>bu", "<CMD>set nobuflisted<CR>", desc = "Make buffer unlisted" },

    -- Window opening/closing
    { "<Leader>-", "<CMD>new<CR>", desc = "Open new file in split" },
    { "<Leader>.-", "<CMD>new %:h<CR>", desc = "Edit current directory in split" },
    { "<Leader>.\\", "<CMD>vnew %:h<CR>", desc = "Edit current directory in vsplit" },
    { "<Leader><Leader>-", "<CMD>split<CR>", desc = "Open current file in split" },
    { "<Leader><Leader>.", "<CMD>e %:h<CR>", desc = "Edit current directory" },
    { "<Leader><Leader>\\", "<CMD>vsplit<CR>", desc = "Open current file in vsplit" },
    { "<Leader>\\", "<CMD>vnew<CR>", desc = "Open new file in vsplit" },
    { "<Leader>wT", "<C-W>T", desc = "Open current window in new tab" },
    { "<Leader>w]", "<C-W>]", desc = "Go to identifier in split" },
    { "<Leader>wc", "<C-W>c", desc = "Close current window" },
    { "<Leader>wo", "<C-W>o", desc = "Make current window the only one" },
    { "<Leader>wq", "<C-W>q", desc = "Quit window" },
    { "<Leader>ws", "<C-W>s", desc = "Split window (horizontal)" },
    { "<Leader>wv", "<C-W>v", desc = "Split window (vertical)" },
    { "<Leader>wz", "<C-W>z", desc = "Close preview window" },
    { "<Leader>w}", "<C-W>}", desc = "Go to identifier in preview" },
    { "<Leader>wx", "<C-W>x", desc = "Exchange current window with next" },
    { "<Leader>wa", "<C-^>", desc = "Edit alternate buffer in current window" },
    { "<Leader>wA", "<C-W>^", desc = "Edit alternate buffer in split" },

    -- Window movements
    { "<C-h>", "<C-W>h", desc = "Left one window" },
    { "<C-j>", "<C-W>j", desc = "Up one window" },
    { "<C-k>", "<C-W>k", desc = "Down one window" },
    { "<C-l>", "<C-W>l", desc = "Right one window" },
    { "<Leader>wh", "<C-W>h", desc = "Left one window" },
    { "<Leader>wj", "<C-W>j", desc = "Up one window" },
    { "<Leader>wk", "<C-W>k", desc = "Down one window" },
    { "<Leader>wl", "<C-W>l", desc = "Right one window" },
    { "<Leader>wH", "<C-W>H", desc = "Move current window to left" },
    { "<Leader>wJ", "<C-W>J", desc = "Move current window to bottom" },
    { "<Leader>wK", "<C-W>K", desc = "Move current window to top" },
    { "<Leader>wL", "<C-W>L", desc = "Move current window to right" },
    { "<Leader>wR", "<C-W>R", desc = "Rotate windows upwards/leftwards" },
    { "<Leader>wW", "<C-W>W", desc = "Previous window" },
    { "<Leader>ww", "<C-W><C-W>", desc = "Next window" },
    { "<Leader>wr", "<C-W>r", desc = "Rotate windows downwards/rightwards" },

    -- Window size
    { "<Leader>w<Bar>", "<C-W><Bar>", desc = "Maximize window width" },
    { "<Leader>w=", "<C-W>=", desc = "Make windows equally high and wide" },
    { "<Leader>w_", "<C-W>_", desc = "Maximize window height" },
    { "<S-C-Down>", "<CMD>resize -2<CR>", desc = "Decrease window height" },
    { "<S-C-Left>", "<CMD>vertical resize -2<CR>", desc = "Decrease window width" },
    { "<S-C-Right>", "<CMD>vertical resize +2<CR>", desc = "Increase window width" },
    { "<S-C-Up>", "<CMD>resize +2<CR>", desc = "Increase window height" },
    { "<A-_>", "<CMD>resize -2<CR>", desc = "Decrease window height" },
    { "<A-<>", "<CMD>vertical resize -2<CR>", desc = "Decrease window width" },
    { "<A->>", "<CMD>vertical resize +2<CR>", desc = "Increase window width" },
    { "<A-+>", "<CMD>resize +2<CR>", desc = "Increase window height" },

    -- Tabs
    { "<C-S-h>", "gT", desc = "Previous tab" },
    { "<C-S-l>", "gt", desc = "Next tab" },
    { "<C-S-t>", "<CMD>tabnew<CR>", desc = "Open new tab" },
    { "<Leader><Tab><BS>", "<CMD>tabclose<CR>", desc = "Close tab" },
    { "<Leader><Tab><Tab>", "<CMD>tabnew<CR>", desc = "New tab" },
    { "<Leader><Tab>h", "<CMD>tabprevious<CR>", desc = "Previous tab" },
    { "<Leader><Tab>l", "<CMD>tabnext<CR>", desc = "Next tab" },
    { "<Leader><Tab>[", "<CMD>tabprevious<CR>", desc = "Previous tab" },
    { "<Leader><Tab>]", "<CMD>tabnext<CR>", desc = "Next tab" },
    { "<Leader><Tab>q", "<CMD>tabclose<CR>", desc = "Close tab" },

    -- Folds
    { "zff", function() require("util").close_text_object_folds("@function.outer") end, desc = "Close folds for functions" },
    { "zfc", function() require("util").close_text_object_folds("@class.outer") end, desc = "Close folds for classes" },
    { "z1", function() require("util").close_folds_with_level(1) end, desc = "Close folds with level 1" },
    { "z2", function() require("util").close_folds_with_level(2) end, desc = "Close folds with level 2" },
    { "z3", function() require("util").close_folds_with_level(3) end, desc = "Close folds with level 3" },
    { "z4", function() require("util").close_folds_with_level(4) end, desc = "Close folds with level 4" },

    -- Code
    { "<Leader>ci", function() vim.show_pos() end, desc = "Inspect under cursor" },
    { "<Leader>cI", function() vim.treesitter.inspect_tree() end, desc = "Inspect treesitter tree" },

    { ",.", "<C-U>", desc = "Scroll up" },
    { ",/", "<C-D>", desc = "Scroll down" },
    { ",[", "<C-T>", desc = "Pop tag from stack" },
    { ",]", "<C-]>", desc = "Jump to tag" },
    { ",cd", "<CMD>cd %:h<CR>", desc = "Change current working directory to current file directory" },
    { ",do", "<CMD>diffoff<CR>", desc = "Diff off" },
    { ",dt", "<CMD>diffthis<CR>", desc = "Diff this" },
    { ",du", "<CMD>diffupdate<CR>", desc = "Diff update" },
    { ",r", "<C-R>", desc = "Redo last change" },
    { ",vb", "<C-V>", desc = "Visual block mode" },
    { ",x12", "<CMD>%!x12pp<CR><CMD>set ft=x12<CR>", desc = "Format X12 file" },
    { ",cr", "<CMD>%!dos2unix<CR>", desc = "Convert line endings to CR" },
    { "<C-g>", "2<C-g>", desc = "Print current file name" },

    -- Toggles
    { "<Leader>uC", function() require("util").toggle("cursorcolumn") end, desc = "Toggle cursorcolumn" },
    { "<Leader>uc", function() require("util").toggle("cursorline") end, desc = "Toggle cursorline" },
    {
      "<Leader>ud",
      function()
        local enabled = vim.diagnostic.is_enabled()
        vim.notify((enabled and "Disabled" or "Enabled") .. " diagnostics")
        vim.diagnostic.enable(not enabled)
      end,
      desc = "Toggle diagnostics",
    },
    { "<Leader>uw", function() require("util").toggle("wrap") end, desc = "Toggle wrap" },
    { "<leader>ul", function() require("util").toggle_number() end, desc = "Toggle line numbers" },
    { "<leader>ur", function() require("util").toggle("relativenumber") end, desc = "Toggle relative line numbers" },

    -- Yank/paste
    { "Y", "_y$", desc = "Yank line character-wise without indent" },
    { ",P", '"+P', desc = "Paste from system clipboard" },
    { ",p", '"+p', desc = "Paste from system clipboard" },
    { "<Leader>Pb", 'i <C-R>" <Esc>', desc = "Paste before cursor and add space at both ends" },
    { "<Leader>Pe", 'i<C-R>" <Esc>', desc = "Paste before cursor and add space at end" },
    { "<Leader>Ps", 'i <C-R>"<Esc>', desc = "Paste before cursor and add space at start" },
    { "<Leader>pb", 'a <C-R>" <Esc>', desc = "Paste after cursor and add space at both ends" },
    { "<Leader>pe", 'a<C-R>" <Esc>', desc = "Paste after cursor and add space at end" },
    { "<Leader>ps", 'a <C-R>"<Esc>', desc = "Paste after cursor and add space at start" },
    { "<S-Insert>", '"+P', desc = "Paste from system clipboard" },

    -- Motions
    { "b", "<CMD>call search('\\<', 'b')<CR>", desc = "Previous word" },
    { "e", "<CMD>call search('\\>')<CR>", desc = "Next end of word" },
    { "ge", "<CMD>call search('\\>', 'b')<CR>", desc = "Previous end of word" },
    { "w", "<CMD>call search('\\<')<CR>", desc = "Next word" },
    -- "{", "<CMD>call search('\\(\\n\\n\\|\\%^\\)\\s*\\zs\\S', 'b')<CR>",  desc = "Previous start of paragraph"  },
    -- "}", "<CMD>call search('\\n\\n\\s*\\zs\\S')<CR>",  desc = "Next start of paragraph"  },
    { "{", "[{", desc = "Previous unmatched {" },
    { "}", "]}", desc = "Next unmatched }" },
    { "(", "[(", desc = "Previous unmatched (" },
    { ")", "])", desc = "Next unmatched )" },

    -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
    { "n", "'Nn'[v:searchforward].'zv'", expr = true, desc = "Next search result" },
    { mode = "x", "n", "'Nn'[v:searchforward]", expr = true, desc = "Next search result" },
    { mode = "o", "n", "'Nn'[v:searchforward]", expr = true, desc = "Next search result" },
    { "N", "'nN'[v:searchforward].'zv'", expr = true, desc = "Previous search result" },
    { mode = "x", "N", "'nN'[v:searchforward]", expr = true, desc = "Previous search result" },
    { mode = "o", "N", "'nN'[v:searchforward]", expr = true, desc = "Previous search result" },
  },

  -- Insert mode
  {
    mode = "i",
    { "<C-s>", "<C-\\><C-o><CMD>w!<CR>", desc = "Save" },
    { "<A-BS>", "<C-\\><C-o>dB", desc = "Delete until the previous space" },
    { "<A-h>", "<Left>", noremap = false, desc = "Left" },
    { "<A-j>", "<Down>", noremap = false, desc = "Down" },
    { "<A-k>", "<Up>", noremap = false, desc = "Up" },
    { "<A-l>", "<Right>", noremap = false, desc = "Right" },
    { "<C-BS>", "<C-w>", desc = "Delete previous word" },
    { "<C-Enter>", "<Esc>m`o<Esc>``a", desc = "Insert blank line below" },
    { "<C-S-Enter>", "<Esc>m`O<Esc>``a", desc = "Insert blank line above" },
    { "<Esc>", "<Esc>`^", desc = "Exit insert mode" },
    { "<S-Insert>", "<C-r><C-o>+", desc = "Paste from system clipboard" },
    { "<S-Tab>", "<C-d>", desc = "Unindent line" },
  },

  -- Visual and select mode
  {
    mode = "v",
    { ",y", '"+y', desc = "Yank to system clipboard" },
    { "<C-Insert>", '"+y', desc = "Yank to system clipboard" },
    { "<Leader>sl", ":sort i<CR>", desc = "Sort lines" },
    { "<Leader>sn", ":sort in<CR>", desc = "Sort lines by number" },
    { "<Leader>su", ":sort iu<CR>", desc = "Sort lines unique" },
    { "<S-Insert>", '"+P', desc = "Paste from system clipboard" },
    { "<lt>", "<lt>gv", desc = "Decrease indent" },
    { ">", ">gv", desc = "Increase indent" },
    { "p", '"_dP', desc = "Paste" },
    { ",.", "<C-U>", desc = "Scroll up" },
    { ",/", "<C-D>", desc = "Scroll down" },
  },

  -- Terminal mode
  {
    mode = "t",
    { "<C-h>", "<C-\\><C-N><C-w>h", desc = "Left" },
    { "<C-j>", "<C-\\><C-N><C-w>j", desc = "Down" },
    { "<C-k>", "<C-\\><C-N><C-w>k", desc = "Up" },
    { "<C-l>", "<C-\\><C-N><C-w>l", desc = "Right" },
    { "<S-Enter>", "<Enter>", desc = "Insert enter" },
    { "<S-Esc>", "<C-\\><C-N>", desc = "Go to normal mode" },
    { "<S-Insert>", '<C-\\><C-N>"+pi', desc = "Paste from system clipboard" },
    { "<S-Space>", "<Space>", desc = "Insert space" },
  },

  -- Cmdline mode
  {
    mode = "c",
    { "<S-Insert>", "<C-R><C-R>+", desc = "Paste from system clipboard", silent = false },
    { "<C-BS>", "<C-w>", desc = "Delete previous word", silent = false },
    { "<C-j>", function() return vim.fn.wildmenumode() == 1 and "<C-n>" or "<C-j>" end, expr = true, desc = "Wildmenu down", silent = false },
    { "<C-k>", function() return vim.fn.wildmenumode() == 1 and "<C-p>" or "<C-k>" end, expr = true, desc = "Wildmenu up", silent = false },
  },
})
