require("which-key")

local map = function(mode, lhs, rhs, opts)
  vim.tbl_deep_extend("force", { silent = true, noremap = true }, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Misc
map("n", "<Esc>", "<CMD>noh<CR><Esc>", { desc = "Clear search highlighting" })
map("n", "<BS>", "<CMD>noh<CR>", { desc = "Clear search highlighting" })
map("n", "<C-s>", "<CMD>w!<CR>", { desc = "Save" })
map("i", "<C-s>", "<C-O><CMD>w!<CR>", { desc = "Save" })
map("n", "<Leader>C", "<CMD>:e $MYVIMRC<CR>", { desc = "Edit configuration" })
map("n", "<Leader>Q", "<CMD>qa!<CR>", { desc = "Quit all without saving" })
map("n", "<Leader>pp", "<CMD>Lazy sync<CR>", { desc = "Lazy sync" })
map("n", "<Leader>qq", "<CMD>qa<CR>", { desc = "Quit all" })
map("n", "<Leader>iu", vim.show_pos, { desc = "Inspect under cursor" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("n", "[<Space>", "<CMD>put! =repeat(nr2char(10), v:count1)|silent ']+<CR>", { desc = "Add blank line above" })
map("n", "]<Space>", "<CMD>put =repeat(nr2char(10), v:count1)|silent '[-<CR>", { desc = "Add blank line below" })
map(
  "n",
  "gX",
  "<CMD>call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))<CR>",
  { desc = "Open current path or URI" }
)
map(
  "v",
  "gX",
  "<CMD>call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))<CR>",
  { desc = "Open current path or URI" }
)

-- Buffers
map(
  "n",
  "<Leader><Esc>",
  function() require("util").close_window_or_buffer() end,
  { desc = "Delete buffer and close window" }
)
map("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Next buffer" })

-- Windows
map("n", "<Leader>w,", "<C-W>-", { desc = "Decrease window height" })
map("n", "<Leader>w.", "<C-W>+", { desc = "Increase window height" })
map("n", "<Leader>w<Bar>", "<C-W><Bar>", { desc = "Maximize window width" })
map("n", "<Leader>w<lt>", "<C-W><lt>", { desc = "Decrease window width" })
map("n", "<Leader>w=", "<C-W>=", { desc = "Make windows equally high and wide" })
map("n", "<Leader>w>", "<C-W>>", { desc = "Increase window width" })
map("n", "<Leader>w]", "<C-W>]", { desc = "Go to identifier in split" })
map("n", "<Leader>w_", "<C-W>_", { desc = "Maximize window height" })
map("n", "<Leader>wa", "<C-^>", { desc = "Edit alternate buffer in current window" })
map("n", "<Leader>wc", "<C-W>c", { desc = "Close current window" })
map("n", "<Leader>wh", "<C-W>h", { desc = "Left one window" })
map("n", "<Leader>wH", "<C-W>H", { desc = "Move current window to left" })
map("n", "<Leader>wJ", "<C-W>J", { desc = "Move current window to bottom" })
map("n", "<Leader>wj", "<C-W>j", { desc = "Up one window" })
map("n", "<Leader>wk", "<C-W>k", { desc = "Down one window" })
map("n", "<Leader>wK", "<C-W>K", { desc = "Move current window to top" })
map("n", "<Leader>wL", "<C-W>L", { desc = "Move current window to right" })
map("n", "<Leader>wl", "<C-W>l", { desc = "Right one window" })
map("n", "<Leader>wn", "<C-W><C-W>", { desc = "Next window" })
map("n", "<Leader>wo", "<C-W>o", { desc = "Make current window the only one" })
map("n", "<Leader>wp", "<C-W>W", { desc = "Previous window" })
map("n", "<Leader>wq", "<C-W>q", { desc = "Quit window" })
map("n", "<Leader>wr", "<C-W>r", { desc = "Rotate windows downwards/rightwards" })
map("n", "<Leader>wR", "<C-W>R", { desc = "Rotate windows upwards/leftwards" })
map("n", "<Leader>ws", "<C-W>s", { desc = "Split window (horizontal)" })
map("n", "<Leader>wT", "<C-W>T", { desc = "Open current window in new tab" })
map("n", "<Leader>wv", "<C-W>v", { desc = "Split window (vertical)" })
map("n", "<Leader>ww", "<C-W><C-W>", { desc = "Next window" })
map("n", "<Leader>wW", "<C-W>W", { desc = "Previous window" })
map("n", "<Leader>wx", "<C-W>x", { desc = "Exchange current window with next" })
map("n", "<C-Down>", "<CMD>resize +2<CR>", { desc = "Resize window +2" })
map("n", "<C-h>", "<C-W>h", { desc = "Left one window" })
map("n", "<C-j>", "<C-W>j", { desc = "Up one window" })
map("n", "<C-k>", "<C-W>k", { desc = "Down one window" })
map("n", "<C-l>", "<C-W>l", { desc = "Right one window" })
map("n", "<C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Vertical resize window -2" })
map("n", "<C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Vertical resize window +2" })
map("n", "<C-Up>", "<CMD>resize -2<CR>", { desc = "Resize window -2" })

-- Tabs
map("n", "<Leader><Tab><BS>", "<CMD>tabclose<CR>", { desc = "Close tab" })
map("n", "<Leader><Tab><Tab>", "<CMD>tabnew<CR>", { desc = "New tab" })
map("n", "<Leader><Tab>h", "<CMD>tabprevious<CR>", { desc = "Previous tab" })
map("n", "<Leader><Tab>l", "<CMD>tabnext<CR>", { desc = "Next tab" })
map("n", "<Leader><Tab>d", "<CMD>tabclose<CR>", { desc = "Close tab" })
map("n", "<Leader><Tab>f", "<CMD>tabfirst<CR>", { desc = "First tab" })
map("n", "<Leader><Tab>l", "<CMD>tablast<CR>", { desc = "Last tab" })
map("n", "<C-F4>", "<CMD>tabclose<CR>", { desc = "Close tab" })
map("n", "<C-S-=>", "<CMD>tabnew<CR>", { desc = "Open new tab" })
map("n", "<C-S-_>", "<CMD>tabclose<CR>", { desc = "Close tab" })
map("n", "<C-S-h>", "gT", { desc = "Previous tab" })
map("n", "<C-S-l>", "gt", { desc = "Next tab" })
map("n", "<C-S-t>", "<CMD>tabnew<CR>", { desc = "Open new tab" })

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

-- LSP
map("n", "<Leader>li", "<CMD>LspInfo<CR>", { desc = "LSP info" })
map("n", "<Leader>lI", "<CMD>Mason<CR>", { desc = "Mason installer info" })

-- Terminals
map("n", "<Leader>gg", _LAZYGIT_TOGGLE, { desc = "Lazygit" })
map("n", "<Leader>tf", _TERMINAL_TOGGLE, { desc = "Float" })
map("n", "<Leader>th", _TERMINAL_HORIZONTAL_TOGGLE, { desc = "Horizontal" })
map("n", "<Leader>tm", _MC_TOGGLE, { desc = "Midnight Commander" })
map("n", "<Leader>tp", _PYTHON_TOGGLE, { desc = "Python" })
map("n", "<Leader>tv", _TERMINAL_VERTICAL_TOGGLE, { desc = "Vertical" })

-- Normal mode
map("n", ",.", "<C-U>", { desc = "Scroll up" })
map("n", ",/", "<C-D>", { desc = "Scroll down" })
map("n", ",[", "<C-T>", { desc = "Pop tag from stack" })
map("n", ",]", "<C-]>", { desc = "Jump to tag" })
map("n", ",cd", ":cd %:h<CR>", { desc = "Change current working directory to current file directory" })
map("n", ",do", "<CMD>diffoff<CR>", { desc = "Diff off" })
map("n", ",dt", "<CMD>diffthis<CR>", { desc = "Diff this" })
map("n", ",du", "<CMD>diffupdate<CR>", { desc = "Diff update" })
map("n", ",p", '"+p', { desc = "Paste from system clipboard" })
map("n", ",P", '"+P', { desc = "Paste from system clipboard" })
map("n", ",r", "<C-R>", { desc = "Redo last change" })
map("n", ",s.", "<CMD>new .<CR>", { desc = "Open current directory in new split" })
map("n", ",sc", "<CMD>split<CR>", { desc = "Open current file in new split" })
map("n", ",sn", "<CMD>new<CR>", { desc = "Open new file in split" })
map("n", ",v.", "<CMD>vnew .<CR>", { desc = "Open current directory in new vsplit" })
map("n", ",vb", "<C-V>", { desc = "Visual block mode" })
map("n", ",vc", "<CMD>vsplit<CR>", { desc = "Open current file in new vsplit" })
map("n", ",vn", "<CMD>vnew<CR>", { desc = "Open new file in vsplit" })
map("n", ",x12", ":%!x12pp<CR>:set ft=x12<CR>", { desc = "Format X12 file" })
map("n", "<Leader>pb", 'a <C-R>" <Esc>', { desc = "Paste after cursor and add space at both ends" })
map("n", "<Leader>Pb", 'i <C-R>" <Esc>', { desc = "Paste before cursor and add space at both ends" })
map("n", "<Leader>pe", 'a<C-R>" <Esc>', { desc = "Paste after cursor and add space at end" })
map("n", "<Leader>Pe", 'i<C-R>" <Esc>', { desc = "Paste before cursor and add space at end" })
map("n", "<Leader>ps", 'a <C-R>"<Esc>', { desc = "Paste after cursor and add space at start" })
map("n", "<Leader>Ps", 'i <C-R>"<Esc>', { desc = "Paste before cursor and add space at start" })
map("n", "<Leader>1", '"=nr2char(getchar())<CR>P', { desc = "Insert one character" })
map("n", "<S-Insert>", '"+P', { desc = "Paste from system clipboard" })
map("n", "Y", "_y$", { desc = "Yank line character-wise without indent" })

-- Motions
map("n", "w", "<CMD>call search('\\<')<CR>", { desc = "Next word" })
map("n", "b", "<CMD>call search('\\<', 'b')<CR>", { desc = "Previous word" })
map("n", "e", "<CMD>call search('\\>')<CR>", { desc = "Next end of word" })
map("n", "ge", "<CMD>call search('\\>', 'b')<CR>", { desc = "Previous end of word" })

-- Insert mode
map("i", "<Esc>", "<Esc>`^", { desc = "Exit insert mode" })
map("i", "<S-Enter>", "<Esc>m`o<Esc>``a", { desc = "Insert blank line below" })
map("i", "<C-S-Enter>", "<Esc>m`O<Esc>``a", { desc = "Insert blank line above" })
map("i", "<S-Insert>", '<C-o>"+P', { desc = "Paste from system clipboard" })
map("i", "<S-Tab>", "<C-d>", { desc = "Unindent line" })
map("i", "<A-[>", "{<CR>},<Esc>O", { desc = "{|}," })
map("i", "<A-9>", "(),<Esc><Left>i", { desc = "(|)," })
map("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })
map("i", "<A-BS>", "<C-\\><C-o>dB", { desc = "Delete until the previous space" })
map("i", "<A-h>", "<Left>", { noremap = false, desc = "Left" })
map("i", "<A-j>", "<Down>", { noremap = false, desc = "Down" })
map("i", "<A-k>", "<Up>", { noremap = false, desc = "Up" })
map("i", "<A-l>", "<Right>", { noremap = false, desc = "Right" })

-- Visual and select mode
map("v", ",y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<C-Insert>", '"+y', { desc = "Yank to system clipboard" })
map("v", "<S-Insert>", '"+P', { desc = "Paste from system clipboard" })
map("v", "<lt>", "<lt>gv", { desc = "Decrease indent" })
map("v", ">", ">gv", { desc = "Increase indent" })
map("v", "p", '"_dP', { desc = "Paste" })
map("v", "<Leader>sl", ":sort i<CR>", { desc = "Sort lines" })
map("v", "<Leader>sn", ":sort in<CR>", { desc = "Sort lines by number" })
map("v", "<Leader>su", ":sort iu<CR>", { desc = "Sort lines unique" })

-- Terminal mode
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Left" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Down" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Right" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Up" })

-- Visual mode
map("v", ",.", "<C-U>", { desc = "Scroll up" })
map("v", ",/", "<C-D>", { desc = "Scroll down" })
map("v", "J", ":m '>+1<CR>gv-gv", { desc = "Move lines down" })
map("v", "K", ":m '<-2<CR>gv-gv", { desc = "Move lines up" })

-- Better wildmenu navigation
map(
  "c",
  "<C-j>",
  function() return vim.fn.wildmenumode() == 1 and "<C-n>" or "<C-j>" end,
  { expr = true, desc = "Wildmenu down", silent = false }
)
map(
  "c",
  "<Down>",
  function() return vim.fn.wildmenumode() == 1 and "<C-n>" or "<Down>" end,
  { expr = true, desc = "Wildmenu down", silent = false }
)
map(
  "c",
  "<C-k>",
  function() return vim.fn.wildmenumode() == 1 and "<C-p>" or "<C-k>" end,
  { expr = true, desc = "Wildmenu up", silent = false }
)
map(
  "c",
  "<Up>",
  function() return vim.fn.wildmenumode() == 1 and "<C-p>" or "<Up>" end,
  { expr = true, desc = "Wildmenu up", silent = false }
)

-- Toggles
map("n", "<Leader>ud", function() require("util").toggle_diagnostics() end, { desc = "Toggle diagnostics" })
map("n", "<Leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle inlay hints" })
map("n", "<Leader>uf", require("plugins.lsp.formatting").toggle, { desc = "Toggle format on save" })
map("n", "<Leader>uw", function() require("util").toggle("wrap") end, { desc = "Toggle wrap" })
map("n", "<leader>ul", function() require("util").toggle_number() end, { desc = "Toggle line numbers" })
map(
  "n",
  "<leader>ur",
  function() require("util").toggle("relativenumber") end,
  { desc = "Toggle relative line numbers" }
)

-- Command-line mode
map("c", "<S-Insert>", "<C-R><C-R>+", { desc = "Paste from system clipboard" })
map("c", "<M-h>", "<Left>", { silent = false, desc = "Left" })
map("c", "<M-l>", "<Right>", { silent = false, desc = "Right" })
