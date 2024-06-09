local map = function(mode, lhs, rhs, opts)
  opts = vim.tbl_deep_extend("force", { silent = true }, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Misc
map({ "n", "v" }, "<S-F1>", "<CMD>WhichKey<CR>", { desc = "Show keys" })
map("n", "<C-,>", "<CMD>:e $MYVIMRC<CR>", { desc = "Edit configuration" })
map("n", "<Leader>L", "<CMD>Lazy sync<CR>", { desc = "Lazy" })
map("n", "<Leader>q", "<CMD>qa<CR>", { desc = "Quit all" })
map("n", "<BS>", '<CMD>noh | echon ""<CR>', { desc = "Clear search highlighting" })
map("n", "<Esc>", '<CMD>noh | echon ""<CR><Esc>', { desc = "Clear search highlighting" })
map("i", "<C-s>", "<C-\\><C-o><CMD>w!<CR>", { desc = "Save" })
map("n", "<C-s>", "<CMD>w!<CR>", { desc = "Save" })
-- map("n", "!", '"=nr2char(getchar())<CR>P', { desc = "Insert one character" })

-- Adding blank lines
map(
  "n",
  "<Leader><Enter>",
  "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>k",
  { desc = "Add blank line on current line" }
)
map("n", "[<Space>", "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>", { desc = "Add blank line above" })
map("n", "]<Space>", "<CMD>put =repeat(nr2char(10), v:count1)|silent '[-<CR>", { desc = "Add blank line below" })

-- Better motions with word wrap on
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Center screen after scrolling
map("n", "<C-D>", "<C-D>zz", {})
map("n", "<C-U>", "<C-U>zz", {})
map("n", "<C-F>", "<C-F>zz", {})
map("n", "<C-B>", "<C-B>zz", {})

-- Buffers
map(
  "n",
  "<Leader><Esc>",
  function() require("util").close_window_or_buffer() end,
  { desc = "Delete buffer and close window" }
)
map(
  "n",
  "<Leader><BS>",
  function() require("util").close_window_or_buffer() end,
  { desc = "Delete buffer and close window" }
)
map("n", "q", function() require("util").close_window_or_buffer() end, { desc = "Delete buffer and close window" })
map("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Next buffer" })
map("n", "<Leader>bl", "<CMD>set buflisted<CR>", { desc = "Make buffer listed" })
map("n", "<Leader>bu", "<CMD>set nobuflisted<CR>", { desc = "Make buffer unlisted" })

-- Window opening/closing
map("n", "<Leader>-", "<CMD>new<CR>", { desc = "Open new file in split" })
map("n", "<Leader>.-", "<CMD>new %:h<CR>", { desc = "Edit current directory in split" })
map("n", "<Leader>.\\", "<CMD>vnew %:h<CR>", { desc = "Edit current directory in vsplit" })
map("n", "<Leader><Leader>-", "<CMD>split<CR>", { desc = "Open current file in split" })
map("n", "<Leader><Leader>.", "<CMD>e %:h<CR>", { desc = "Edit current directory" })
map("n", "<Leader><Leader>\\", "<CMD>vsplit<CR>", { desc = "Open current file in vsplit" })
map("n", "<Leader>\\", "<CMD>vnew<CR>", { desc = "Open new file in vsplit" })
map("n", "<Leader>wT", "<C-W>T", { desc = "Open current window in new tab" })
map("n", "<Leader>w]", "<C-W>]", { desc = "Go to identifier in split" })
map("n", "<Leader>wc", "<C-W>c", { desc = "Close current window" })
map("n", "<Leader>wo", "<C-W>o", { desc = "Make current window the only one" })
map("n", "<Leader>wq", "<C-W>q", { desc = "Quit window" })
map("n", "<Leader>ws", "<C-W>s", { desc = "Split window (horizontal)" })
map("n", "<Leader>wv", "<C-W>v", { desc = "Split window (vertical)" })
map("n", "<Leader>wz", "<C-W>z", { desc = "Close preview window" })
map("n", "<Leader>w}", "<C-W>}", { desc = "Go to identifier in preview" })
map("n", "<Leader>wx", "<C-W>x", { desc = "Exchange current window with next" })
map("n", "<Leader>wa", "<C-^>", { desc = "Edit alternate buffer in current window" })
map("n", "<Leader>wA", "<C-W>^", { desc = "Edit alternate buffer in split" })

-- Window movements
map("n", "<C-h>", "<C-W>h", { desc = "Left one window" })
map("n", "<C-j>", "<C-W>j", { desc = "Up one window" })
map("n", "<C-k>", "<C-W>k", { desc = "Down one window" })
map("n", "<C-l>", "<C-W>l", { desc = "Right one window" })
map("n", "<Leader>wh", "<C-W>h", { desc = "Left one window" })
map("n", "<Leader>wj", "<C-W>j", { desc = "Up one window" })
map("n", "<Leader>wk", "<C-W>k", { desc = "Down one window" })
map("n", "<Leader>wl", "<C-W>l", { desc = "Right one window" })
map("n", "<Leader>wH", "<C-W>H", { desc = "Move current window to left" })
map("n", "<Leader>wJ", "<C-W>J", { desc = "Move current window to bottom" })
map("n", "<Leader>wK", "<C-W>K", { desc = "Move current window to top" })
map("n", "<Leader>wL", "<C-W>L", { desc = "Move current window to right" })
map("n", "<Leader>wR", "<C-W>R", { desc = "Rotate windows upwards/leftwards" })
map("n", "<Leader>wW", "<C-W>W", { desc = "Previous window" })
map("n", "<Leader>ww", "<C-W><C-W>", { desc = "Next window" })
map("n", "<Leader>wr", "<C-W>r", { desc = "Rotate windows downwards/rightwards" })

-- Window size
map("n", "<Leader>w<Bar>", "<C-W><Bar>", { desc = "Maximize window width" })
map("n", "<Leader>w=", "<C-W>=", { desc = "Make windows equally high and wide" })
map("n", "<Leader>w_", "<C-W>_", { desc = "Maximize window height" })
map("n", "<S-C-Down>", "<CMD>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<S-C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<S-C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase window width" })
map("n", "<S-C-Up>", "<CMD>resize +2<CR>", { desc = "Increase window height" })
map("n", "<A-_>", "<CMD>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<A-<>", "<CMD>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<A->>", "<CMD>vertical resize +2<CR>", { desc = "Increase window width" })
map("n", "<A-+>", "<CMD>resize +2<CR>", { desc = "Increase window height" })

-- Tabs
map("n", "<C-S-h>", "gT", { desc = "Previous tab" })
map("n", "<C-S-l>", "gt", { desc = "Next tab" })
map("n", "<C-S-t>", "<CMD>tabnew<CR>", { desc = "Open new tab" })
map("n", "<Leader><Tab><BS>", "<CMD>tabclose<CR>", { desc = "Close tab" })
map("n", "<Leader><Tab><Tab>", "<CMD>tabnew<CR>", { desc = "New tab" })
map("n", "<Leader><Tab>h", "<CMD>tabprevious<CR>", { desc = "Previous tab" })
map("n", "<Leader><Tab>l", "<CMD>tabnext<CR>", { desc = "Next tab" })
map("n", "<Leader><Tab>[", "<CMD>tabprevious<CR>", { desc = "Previous tab" })
map("n", "<Leader><Tab>]", "<CMD>tabnext<CR>", { desc = "Next tab" })
map("n", "<Leader><Tab>q", "<CMD>tabclose<CR>", { desc = "Close tab" })

-- Folds
map(
  "n",
  "zff",
  function() require("util").close_text_object_folds("@function.outer") end,
  { desc = "Close folds for functions" }
)
map(
  "n",
  "zfc",
  function() require("util").close_text_object_folds("@class.outer") end,
  { desc = "Close folds for classes" }
)
map("n", "z1", function() require("util").close_folds_with_level(1) end, { desc = "Close folds with level 1" })
map("n", "z2", function() require("util").close_folds_with_level(2) end, { desc = "Close folds with level 2" })
map("n", "z3", function() require("util").close_folds_with_level(3) end, { desc = "Close folds with level 3" })
map("n", "z4", function() require("util").close_folds_with_level(4) end, { desc = "Close folds with level 4" })

-- Code
map("n", "<Leader>ci", function() vim.show_pos() end, { desc = "Inspect under cursor" })
map("n", "<Leader>cI", function() vim.treesitter.inspect_tree() end, { desc = "Inspect treesitter tree" })

-- Normal mode
map("n", ",.", "<C-U>", { desc = "Scroll up" })
map("n", ",/", "<C-D>", { desc = "Scroll down" })
map("n", ",[", "<C-T>", { desc = "Pop tag from stack" })
map("n", ",]", "<C-]>", { desc = "Jump to tag" })
map("n", ",cd", "<CMD>cd %:h<CR>", { desc = "Change current working directory to current file directory" })
map("n", ",do", "<CMD>diffoff<CR>", { desc = "Diff off" })
map("n", ",dt", "<CMD>diffthis<CR>", { desc = "Diff this" })
map("n", ",du", "<CMD>diffupdate<CR>", { desc = "Diff update" })
map("n", ",r", "<C-R>", { desc = "Redo last change" })
map("n", ",vb", "<C-V>", { desc = "Visual block mode" })
map("n", ",x12", "<CMD>%!x12pp<CR><CMD>set ft=x12<CR>", { desc = "Format X12 file" })
map("n", ",cr", "<CMD>%!dos2unix<CR>", { desc = "Convert line endings to CR" })

-- Yank/paste
map("n", "Y", "_y$", { desc = "Yank line character-wise without indent" })
map("n", ",P", '"+P', { desc = "Paste from system clipboard" })
map("n", ",p", '"+p', { desc = "Paste from system clipboard" })
map("n", "<Leader>Pb", 'i <C-R>" <Esc>', { desc = "Paste before cursor and add space at both ends" })
map("n", "<Leader>Pe", 'i<C-R>" <Esc>', { desc = "Paste before cursor and add space at end" })
map("n", "<Leader>Ps", 'i <C-R>"<Esc>', { desc = "Paste before cursor and add space at start" })
map("n", "<Leader>pb", 'a <C-R>" <Esc>', { desc = "Paste after cursor and add space at both ends" })
map("n", "<Leader>pe", 'a<C-R>" <Esc>', { desc = "Paste after cursor and add space at end" })
map("n", "<Leader>ps", 'a <C-R>"<Esc>', { desc = "Paste after cursor and add space at start" })
map("n", "<S-Insert>", '"+P', { desc = "Paste from system clipboard" })

-- Motions
map("n", "b", "<CMD>call search('\\<', 'b')<CR>", { desc = "Previous word" })
map("n", "e", "<CMD>call search('\\>')<CR>", { desc = "Next end of word" })
map("n", "ge", "<CMD>call search('\\>', 'b')<CR>", { desc = "Previous end of word" })
map("n", "w", "<CMD>call search('\\<')<CR>", { desc = "Next word" })
-- map("n", "{", "<CMD>call search('\\(\\n\\n\\|\\%^\\)\\s*\\zs\\S', 'b')<CR>", { desc = "Previous start of paragraph" })
-- map("n", "}", "<CMD>call search('\\n\\n\\s*\\zs\\S')<CR>", { desc = "Next start of paragraph" })
map("n", "{", "[{", { desc = "Previous unmatched {" })
map("n", "}", "]}", { desc = "Next unmatched }" })
map("n", "(", "[(", { desc = "Previous unmatched (" })
map("n", ")", "])", { desc = "Next unmatched )" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Insert mode
map("i", "<A-BS>", "<C-\\><C-o>dB", { desc = "Delete until the previous space" })
map("i", "<A-h>", "<Left>", { noremap = false, desc = "Left" })
map("i", "<A-j>", "<Down>", { noremap = false, desc = "Down" })
map("i", "<A-k>", "<Up>", { noremap = false, desc = "Up" })
map("i", "<A-l>", "<Right>", { noremap = false, desc = "Right" })
map("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })
map("i", "<C-Enter>", "<Esc>m`o<Esc>``a", { desc = "Insert blank line below" })
map("i", "<C-S-Enter>", "<Esc>m`O<Esc>``a", { desc = "Insert blank line above" })
map("i", "<Esc>", "<Esc>`^", { desc = "Exit insert mode" })
map("i", "<S-Insert>", "<C-r><C-o>+", { desc = "Paste from system clipboard" })
map("i", "<S-Tab>", "<C-d>", { desc = "Unindent line" })

-- Visual and select mode
map("v", ",y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<C-Insert>", '"+y', { desc = "Yank to system clipboard" })
map("v", "<Leader>sl", ":sort i<CR>", { desc = "Sort lines" })
map("v", "<Leader>sn", ":sort in<CR>", { desc = "Sort lines by number" })
map("v", "<Leader>su", ":sort iu<CR>", { desc = "Sort lines unique" })
map("v", "<S-Insert>", '"+P', { desc = "Paste from system clipboard" })
map("v", "<lt>", "<lt>gv", { desc = "Decrease indent" })
map("v", ">", ">gv", { desc = "Increase indent" })
map("v", "p", '"_dP', { desc = "Paste" })

-- Terminal mode
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Left" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Down" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Up" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Right" })
map("t", "<S-Enter>", "<Enter>", { desc = "Insert enter" })
map("t", "<S-Esc>", "<C-\\><C-N>", { desc = "Go to normal mode" })
map("t", "<S-Insert>", '<C-\\><C-N>"+pi', { desc = "Paste from system clipboard" })
map("t", "<S-Space>", "<Space>", { desc = "Insert space" })

-- Visual mode
map("v", ",.", "<C-U>", { desc = "Scroll up" })
map("v", ",/", "<C-D>", { desc = "Scroll down" })

-- Toggles
map("n", "<Leader>uC", function() require("util").toggle("cursorcolumn") end, { desc = "Toggle cursorcolumn" })
map("n", "<Leader>uc", function() require("util").toggle("cursorline") end, { desc = "Toggle cursorline" })
map("n", "<Leader>ud", function()
  local enabled = vim.diagnostic.is_enabled()
  vim.notify((enabled and "Disabled" or "Enabled") .. " diagnostics")
  vim.diagnostic.enable(not enabled)
end, { desc = "Toggle diagnostics" })
map("n", "<Leader>uw", function() require("util").toggle("wrap") end, { desc = "Toggle wrap" })
map("n", "<leader>ul", function() require("util").toggle_number() end, { desc = "Toggle line numbers" })
map("n", "<leader>ur", function() require("util").toggle("relativenumber") end, { desc = "Toggle relative line numbers" })

-- Cmdline mode
map("c", "<S-Insert>", "<C-R><C-R>+", { desc = "Paste from system clipboard", silent = false })
map("c", "<C-BS>", "<C-w>", { desc = "Delete previous word", silent = false })
map("c", "<C-j>", function() return vim.fn.wildmenumode() == 1 and "<C-n>" or "<C-j>" end, { expr = true, desc = "Wildmenu down", silent = false })
map("c", "<C-k>", function() return vim.fn.wildmenumode() == 1 and "<C-p>" or "<C-k>" end, { expr = true, desc = "Wildmenu up", silent = false })
