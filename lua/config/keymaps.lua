local map = function(mode, lhs, rhs, opts)
  vim.tbl_deep_extend("force", { silent = true, noremap = true }, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- stylua: ignore start

-- Misc 
map("n", "<Leader>C", "<CMD>:e $MYVIMRC<CR>", { desc = "Edit configuration" })
map("n", "<Leader>L", "<CMD>Lazy sync<CR>", { desc = "Plugins (Lazy)" })
map("n", "<Leader>qq", "<CMD>qa<CR>", { desc = "Quit all" })
map("n", "<BS>", "<CMD>noh<CR>", { desc = "Clear search highlighting" })
map("n", "<Esc>", "<CMD>noh<CR><Esc>", { desc = "Clear search highlighting" })
map("i", "<C-s>", "<C-\\><C-o><CMD>w!<CR>", { desc = "Save" })
map("n", "<C-s>", "<CMD>w!<CR>", { desc = "Save" })
-- map("n", "!", '"=nr2char(getchar())<CR>P', { desc = "Insert one character" })

-- Adding blank lines
map("n", "<Leader><Enter>", "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>k", { desc = "Add blank line on current line" })
map("n", "[<Space>", "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>", { desc = "Add blank line above" })
map("n", "]<Space>", "<CMD>put =repeat(nr2char(10), v:count1)|silent '[-<CR>", { desc = "Add blank line below" })

-- Better motions with word wrap on
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Buffers
map("n", "<Leader><Esc>", function() require("util").close_window_or_buffer() end, { desc = "Delete buffer and close window" })
map("n", "<Leader><BS>", function() require("util").close_window_or_buffer() end, { desc = "Delete buffer and close window" })
map("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Next buffer" })

-- Window opening
map("n", "<Leader>-", "<CMD>new<CR>", { desc = "Open new file in new split" })
map("n", "<Leader>.-", "<CMD>new .<CR>", { desc = "Edit current directory in new vplit" })
map("n", "<Leader>.\\", "<CMD>vnew .<CR>", { desc = "Edit current directory in new vsplit" })
map("n", "<Leader><Leader>-", "<CMD>split<CR>", { desc = "Open current file in new split" })
map("n", "<Leader><Leader>.", "<CMD>e .<CR>", { desc = "Edit current directory" })
map("n", "<Leader><Leader>\\", "<CMD>vsplit<CR>", { desc = "Open current file in new vsplit" })
map("n", "<Leader>\\", "<CMD>vnew<CR>", { desc = "Open new file in new vsplit" })
map("n", "<Leader>wT", "<C-W>T", { desc = "Open current window in new tab" })
map("n", "<Leader>w]", "<C-W>]", { desc = "Go to identifier in split" })
map("n", "<Leader>wc", "<C-W>c", { desc = "Close current window" })
map("n", "<Leader>wo", "<C-W>o", { desc = "Make current window the only one" })
map("n", "<Leader>wq", "<C-W>q", { desc = "Quit window" })
map("n", "<Leader>ws", "<C-W>s", { desc = "Split window (horizontal)" })
map("n", "<Leader>wv", "<C-W>v", { desc = "Split window (vertical)" })

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
map("n", "<Leader>wx", "<C-W>x", { desc = "Exchange current window with next" })
map("n", "<Leader>wa", "<C-^>", { desc = "Edit alternate buffer in current window" })

-- Window size
map("n", "<Leader>w,", "<C-W>-", { desc = "Decrease window height" })
map("n", "<Leader>w.", "<C-W>+", { desc = "Increase window height" })
map("n", "<Leader>w<Bar>", "<C-W><Bar>", { desc = "Maximize window width" })
map("n", "<Leader>w<lt>", "<C-W><lt>", { desc = "Decrease window width" })
map("n", "<Leader>w=", "<C-W>=", { desc = "Make windows equally high and wide" })
map("n", "<Leader>w>", "<C-W>>", { desc = "Increase window width" })
map("n", "<Leader>w_", "<C-W>_", { desc = "Maximize window height" })
map("n", "<S-C-Down>", "<CMD>resize -2<CR>", { desc = "Resize window -2" })
map("n", "<S-C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Vertical resize window -2" })
map("n", "<S-C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Vertical resize window +2" })
map("n", "<S-C-Up>", "<CMD>resize +2<CR>", { desc = "Resize window +2" })

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
map("n", "zff", function() require("util").close_text_object_folds("@function.outer") end, { desc = "Close folds for functions" })
map("n", "zfc", function() require("util").close_text_object_folds("@class.outer") end, { desc = "Close folds for classes" })
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
map("n", "{", "<CMD>call search('\\(\\n\\n\\|\\%^\\)\\s*\\zs\\S', 'b')<CR>", { desc = "Previous start of paragraph" })
map("n", "}", "<CMD>call search('\\n\\n\\s*\\zs\\S')<CR>", { desc = "Next start of paragraph" })

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
map("i", "<S-Insert>", '<C-r><C-o>+', { desc = "Paste from system clipboard" })
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

-- Visual mode
map("v", ",.", "<C-U>", { desc = "Scroll up" })
map("v", ",/", "<C-D>", { desc = "Scroll down" })

-- Better wildmenu navigation
map("c", "<C-j>", function() return vim.fn.wildmenumode() == 1 and "<C-n>" or "<C-j>" end, { expr = true, desc = "Wildmenu down", silent = false })
map("c", "<C-k>", function() return vim.fn.wildmenumode() == 1 and "<C-p>" or "<C-k>" end, { expr = true, desc = "Wildmenu up", silent = false })
map("c", "<Down>", function() return vim.fn.wildmenumode() == 1 and "<C-n>" or "<Down>" end, { expr = true, desc = "Wildmenu down", silent = false })
map("c", "<Up>", function() return vim.fn.wildmenumode() == 1 and "<C-p>" or "<Up>" end, { expr = true, desc = "Wildmenu up", silent = false })

-- Toggles
map("n", "<Leader>uC", function() require("util").toggle("cursorcolumn") end, { desc = "Toggle cursorcolumn" })
map("n", "<Leader>uc", function() require("util").toggle("cursorline") end, { desc = "Toggle cursorline" })
map("n", "<Leader>ud", function() require("util").toggle_diagnostics() end, { desc = "Toggle diagnostics" })
map("n", "<Leader>uf", require("plugins.lsp.formatting").toggle, { desc = "Toggle format on save" })
map("n", "<Leader>uh", function() vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled(0)) end, { desc = "Toggle inlay hints" })
map("n", "<Leader>uw", function() require("util").toggle("wrap") end, { desc = "Toggle wrap" })
map("n", "<leader>ul", function() require("util").toggle_number() end, { desc = "Toggle line numbers" })
map("n", "<leader>ur", function() require("util").toggle("relativenumber") end, { desc = "Toggle relative line numbers" })

-- Command-line mode
map("c", "<M-h>", "<Left>", { silent = false, desc = "Left" })
map("c", "<M-l>", "<Right>", { silent = false, desc = "Right" })
map("c", "<S-Insert>", "<C-R><C-R>+", { desc = "Paste from system clipboard" })
