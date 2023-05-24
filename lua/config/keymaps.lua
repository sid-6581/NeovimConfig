local wk = require("which-key")

local map = vim.keymap.set

-- Misc
map("n", "<Esc>", "<CMD>noh<CR>", { desc = "Escape and clear search highlighting" })
map("n", "<C-s>", "<CMD>w!<CR>", { desc = "Save" })
map("n", "<Leader>C", "<CMD>:e $MYVIMRC<CR>", { desc = "Edit configuration" })
map("n", "<A-1>", "<CMD>Neotree toggle reveal_force_cwd<CR>", { desc = "File explorer" })
map("n", "<A-2>", "<CMD>Neotree toggle show buffers<CR>", { desc = "Buffer explorer" })
map("n", "<A-3>", "<CMD>Neotree toggle show git_status<CR>", { desc = "Git explorer" })
map("n", "<F1>", "<CMD>Telescope help_tags<CR>", { desc = "Help" })
map("n", "<Leader>pp", "<CMD>Lazy sync<CR>", { desc = "Lazy sync" })

-- Buffers
map("n", "<Leader>bd", "<CMD>Bdelete!<CR>", { desc = "Delete buffer" })

-- Windows
map("n", "<Leader>wd", "<CMD>q<CR>", { desc = "Close Window" })

-- Tabs
map("n", "<Leader><Tab>l", "<CMD>tablast<CR>", { desc = "Last Tab" })
map("n", "<Leader><Tab>f", "<CMD>tabfirst<CR>", { desc = "First Tab" })
map("n", "<Leader><Tab><Tab>", "<CMD>tabnew<CR>", { desc = "New Tab" })
map("n", "<Leader><Tab>]", "<CMD>tabnext<CR>", { desc = "Next Tab" })
map("n", "<Leader><Tab>d", "<CMD>tabclose<CR>", { desc = "Close Tab" })
map("n", "<Leader><Tab>[", "<CMD>tabprevious<CR>", { desc = "Previous Tab" })

map("n", "<Leader>e", "<CMD>Neotree toggle<CR>", { desc = "File explorer" })
map("n", "<Leader>E", "<CMD>Neotree reveal<CR>", { desc = "Find file in explorer" })
map("n", "<Leader>Q", "<CMD>qa!<CR>", { desc = "Quit all without saving" })

-- Telescope
map("n", "<Leader>fa", "<CMD>Telescope<CR>", { desc = "All" })
map("n", "<Leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<Leader>fc", "<CMD>Telescope commands<CR>", { desc = "Commands" })
map("n", "<Leader>fh", "<CMD>Telescope help_tags<CR>", { desc = "Help" })
map("n", "<Leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Files" })
map("n", "<Leader>fg", "<CMD>Telescope git_branches<CR>", { desc = "Git branches" })
map("n", "<Leader>fk", "<CMD>Telescope keymaps<CR>", { desc = "Keymaps" })
map("n", "<Leader>fn", "<CMD>Noice telescope<CR>", { desc = "Noice" })
map("n", "<Leader>fM", "<CMD>Telescope man_pages<CR>", { desc = "Man pages" })
map("n", "<Leader>fp", "<CMD>Telescope projects<CR>", { desc = "Projects" })
map("n", "<Leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<Leader>fR", "<CMD>Telescope registers<CR>", { desc = "Registers" })
map("n", "<Leader>fs", "<CMD>Telescope symbols<CR>", { desc = "Symbols" })
map("n", "<Leader>ft", "<CMD>Telescope live_grep<CR>", { desc = "Text" })
map("n", "<Leader>fu", "<CMD>Telescope undo<CR>", { desc = "Undo" })
map(
  "n",
  "<Leader>fz",
  function() require("telescope").extensions.z.list({ cmd = { vim.o.shell, "-c", "zoxide query -ls" } }) end,
  { desc = "Zoxide" }
)
map("n", "<Leader>f.", "<CMD>Telescope file_browser<CR>", { desc = "Browse files" })

-- Git
map("n", "<Leader>gb", "<CMD>Telescope git_branches<CR>", { desc = "Checkout branch" })
map("n", "<Leader>gc", "<CMD>Telescope git_commits<CR>", { desc = "Checkout commit" })
map("n", "<Leader>gd", "<CMD>Gitsigns diffthis HEAD<CR>", { desc = "Diff" })
map("n", "<Leader>gg", _LAZYGIT_TOGGLE, { desc = "Lazygit" })
map("n", "<Leader>gj", require("gitsigns").next_hunk, { desc = "Next hunk" })
map("n", "<Leader>gk", require("gitsigns").prev_hunk, { desc = "Prev hunk" })
map("n", "<Leader>gl", require("gitsigns").blame_line, { desc = "Blame" })
map("n", "<Leader>go", "<CMD>Telescope git_status<CR>", { desc = "Open changed file" })
map("n", "<Leader>gp", require("gitsigns").preview_hunk, { desc = "Preview hunk" })
map("n", "<Leader>gr", require("gitsigns").reset_hunk, { desc = "Reset hunk" })
map("n", "<Leader>gR", require("gitsigns").reset_buffer, { desc = "Reset buffer" })
map("n", "<Leader>gs", require("gitsigns").stage_hunk, { desc = "Stage hunk" })
map("n", "<Leader>gu", require("gitsigns").undo_stage_hunk, { desc = "Undo stage hunk" })

-- LSP
map("n", "<Leader>li", "<CMD>LspInfo<CR>", { desc = "LSP info" })
map("n", "<Leader>lI", "<CMD>Mason<CR>", { desc = "Mason installer info" })

-- Terminals
map("n", "<Leader>tf", _TERMINAL_TOGGLE, { desc = "Float" })
map("n", "<Leader>th", _TERMINAL_HORIZONTAL_TOGGLE, { desc = "Horizontal" })
map("n", "<Leader>tm", _MC_TOGGLE, { desc = "Midnight Commander" })
map("n", "<Leader>tp", _PYTHON_TOGGLE, { desc = "Python" })
map("n", "<Leader>tv", _TERMINAL_VERTICAL_TOGGLE, { desc = "Vertical" })

map("n", "<C-S-t>", "<CMD>tabnew<CR>", { desc = "Open new tab" })
map("n", "<C-F4>", "<CMD>tabclose<CR>", { desc = "Close tab" })
map("n", "<C-S-h>", "gT", { desc = "Previous tab" })
map("n", "<C-S-l>", "gt", { desc = "Next tab" })
map("n", "<C-S-=>", "<CMD>tabnew<CR>", { desc = "Open new tab" })
map("n", "<C-S-_>", "<CMD>tabclose<CR>", { desc = "Close tab" })
map("n", "<C-Up>", "<CMD>resize -2<CR>", { desc = "Resize window -2" })
map("n", "<C-Down>", "<CMD>resize +2<CR>", { desc = "Resize window +2" })
map("n", "<C-Left>", "<CMD>vertical resize -2<CR>", { desc = "Vertical resize window -2" })
map("n", "<C-Right>", "<CMD>vertical resize +2<CR>", { desc = "Vertical resize window +2" })
map("n", "<C-h>", "<C-W>h", { desc = "Left one window" })
map("n", "<C-j>", "<C-W>j", { desc = "Up one window" })
map("n", "<C-k>", "<C-W>k", { desc = "Down one window" })
map("n", "<C-l>", "<C-W>l", { desc = "Right one window" })
map("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Next buffer" })
map("n", "Y", "_y$", { desc = "Yank line character-wise without indent" })
map("n", "`", '"=nr2char(getchar())<CR>P', { desc = "Insert one character" })
map("n", "<S-Insert>", '"+P', { desc = "Paste from system clipboard" })
map("n", ",p", '"+p', { desc = "Paste from system clipboard" })
map("n", ",P", '"+P', { desc = "Paste from system clipboard" })
map("n", ",r", "<C-R>", { desc = "Redo last change" })
map("n", ",vb", "<C-V>", { desc = "Visual block mode" })
map("n", ",.", "<C-U>", { desc = "Scroll up" })
map("n", ",/", "<C-D>", { desc = "Scroll down" })
map("n", ",]", "<C-]>", { desc = "Jump to tag" })
map("n", ",[", "<C-T>", { desc = "Pop tag from stack" })
map("n", ",lD", "[<C-D>", { desc = "Jump to first macro definition of word" })
map("n", ",ld", "]<C-D>", { desc = "Jump to next macro definition of word" })
map("n", ",lI", "[<C-I>", { desc = "Jump to first line containing word" })
map("n", ",li", "]<C-I>", { desc = "Jump to next line containing word" })
map("n", ",v.", "<CMD>vnew .<CR>", { desc = "Open current directory in new vsplit" })
map("n", ",vn", "<CMD>vnew<CR>", { desc = "Open new file in vsplit" })
map("n", ",vc", "<CMD>vsplit<CR>", { desc = "Open current file in new vsplit" })
map("n", ",s.", "<CMD>new .<CR>", { desc = "Open current directory in new split" })
map("n", ",sn", "<CMD>new<CR>", { desc = "Open new file in split" })
map("n", ",sc", "<CMD>split<CR>", { desc = "Open current file in new split" })
map("n", ",dt", "<CMD>diffthis<CR>", { desc = "Diff this" })
map("n", ",du", "<CMD>diffupdate<CR>", { desc = "Diff update" })
map("n", ",do", "<CMD>diffoff<CR>", { desc = "Diff off" })
map("n", ",w,", "<C-W>-", { desc = "Decrease window height" })
map("n", ",w.", "<C-W>+", { desc = "Increase window height" })
map("n", ",w<lt>", "<C-W><lt>", { desc = "Decrease window width" })
map("n", ",w>", "<C-W>>", { desc = "Increase window width" })
map("n", ",w<Bar>", "<C-W><bar>", { desc = "Maximize window width" })
map("n", ",w=", "<C-W>=", { desc = "Make windows equally high and wide" })
map("n", ",wH", "<C-W>H", { desc = "Move current window to left" })
map("n", ",wJ", "<C-W>J", { desc = "Move current window to bottom" })
map("n", ",wK", "<C-W>K", { desc = "Move current window to top" })
map("n", ",wL", "<C-W>L", { desc = "Move current window to right" })
map("n", ",wR", "<C-W>R", { desc = "Rotate windows upwards/leftwards" })
map("n", ",w_", "<C-W>_", { desc = "Maximize window height" })
map("n", ",wa", "<C-^>", { desc = "Edit alternate buffer in current window" })
map("n", ",wc", "<C-W>c", { desc = "Close current window" })
map("n", ",wh", "<C-W>h", { desc = "Left one window" })
map("n", ",wj", "<C-W>j", { desc = "Up one window" })
map("n", ",wk", "<C-W>k", { desc = "Down one window" })
map("n", ",wl", "<C-W>l", { desc = "Right one window" })
map("n", ",wn", "<C-W><C-W>", { desc = "Next window" })
map("n", ",wo", "<C-W>o", { desc = "Make current window the only one" })
map("n", ",wp", "<C-W>W", { desc = "Previous window" })
map("n", ",wr", "<C-W>r", { desc = "Rotate windows downwards/rightwards" })
map("n", ",wx", "<C-W>x", { desc = "Exchange current window with next" })
map("n", ",w]", "<C-W>]", { desc = "Go to identifier in split" })
map("n", ",x12", ":%!x12pp<CR>:set ft=x12<CR>", { desc = "Format X12 file" })
map("n", ",cd", ":cd %:h<CR>", { desc = "Change current working directory to current file directory" })
map("n", "[c", require("gitsigns").prev_hunk, { desc = "Previous change" })
map("n", "]c", require("gitsigns").next_hunk, { desc = "Next change" })
map("n", "<Leader>pb", 'a <C-R>" <Esc>', { desc = "Paste after cursor and add space at both ends" })
map("n", "<Leader>pe", 'a<C-R>" <Esc>', { desc = "Paste after cursor and add space at end" })
map("n", "<Leader>ps", 'a <C-R>"<Esc>', { desc = "Paste after cursor and add space at start" })
map("n", "<Leader>Pb", 'i <C-R>" <Esc>', { desc = "Paste before cursor and add space at both ends" })
map("n", "<Leader>Pe", 'i<C-R>" <Esc>', { desc = "Paste before cursor and add space at end" })
map("n", "<Leader>Ps", 'i <C-R>"<Esc>', { desc = "Paste before cursor and add space at start" })

-- Insert mode
map("i", "<Esc>", "<Esc>`^", { desc = "Exit insert mode" })
map("i", "<S-Enter>", "<Esc>m`o<Esc>``a", { desc = "Insert blank line below" })
map("i", "<C-S-Enter>", "<Esc>m`O<Esc>``a", { desc = "Insert blank line above" })
map("i", "<S-Insert>", '<C-O>"+P', { desc = "Paste from system clipboard" })
map("i", "<S-Tab>", "<C-D>", { desc = "Unindent line" })
map("i", "<F1>", "<CMD>Telescope help_tags<CR>", { desc = "Help" })
map("i", "<C-Backspace>", "<C-\\><C-O>dB", { desc = "Delete until the previous space" })

-- Visual and select mode
map("v", "<lt>", "<lt>gv", { desc = "Decrease indent" })
map("v", ">", ">gv", { desc = "Increase indent" })
map("v", "al", ":<C-u>normal! 0v$<CR>", { desc = "Yank a line" })
map("v", "il", ":<C-u>normal! ^vg_<CR>", { desc = "Yank inner line" })
map("v", "p", '"_dP', { desc = "Paste" })
map("v", ",sl", ":sort i<CR>", { desc = "Sort lines" })
map("v", ",sn", ":sort in<CR>", { desc = "Sort lines by number" })
map("v", ",su", ":sort iu<CR>", { desc = "Sort lines unique" })
map("v", ",y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<C-Insert>", '"+y', { desc = "Yank to system clipboard" })
map("v", "<S-Insert>", '"+P', { desc = "Paste from system clipboard" })

-- Operator pending mode
map("v", "il", "<CMD>normal! vil<CR>", { desc = "inner line" })
map("v", "al", "<CMD>normal! val<CR>", { desc = "a line" })
map("v", "i/", "<CMD>normal! T/vt/<CR>", { desc = "inner /" })
map("v", "a/", "<CMD>normal! F/vt/<CR>", { desc = "a /" })
map("v", "i,", "<CMD>normal! T,vt,<CR>", { desc = "inner ," })
map("v", "a,", "<CMD>normal! F,vt,<CR>", { desc = "a ," })
map("v", "i.", "<CMD>normal! T.vt.<CR>", { desc = "inner ." })
map("v", "a.", "<CMD>normal! F.vt.<CR>", { desc = "a ." })
map("v", "i_", "<CMD>normal! T_vt_<CR>", { desc = "inner _" })
map("v", "a_", "<CMD>normal! F_vt_<CR>", { desc = "a _" })
map("v", "i-", "<CMD>normal! T-vt-<CR>", { desc = "inner -" })
map("v", "a-", "<CMD>normal! F-vt-<CR>", { desc = "a -" })
map("v", "i%", "<CMD>normal! T%vt%<CR>", { desc = "inner %" })
map("v", "a%", "<CMD>normal! F%vt%<CR>", { desc = "a %" })
map("v", "i=", "<CMD>normal! T=vt=<CR>", { desc = "inner =" })
map("v", "a=", "<CMD>normal! F=vt=<CR>", { desc = "a =" })
map("v", "i?", "<CMD>normal! T?vt?<CR>", { desc = "inner ?" })
map("v", "a?", "<CMD>normal! F?vt?<CR>", { desc = "a ?" })
map("v", "i!", "<CMD>normal! T!vt!<CR>", { desc = "inner !" })
map("v", "a!", "<CMD>normal! F!vt!<CR>", { desc = "a !" })
map("v", "i&", "<CMD>normal! T&vt&<CR>", { desc = "inner &" })
map("v", "a&", "<CMD>normal! F&vt&<CR>", { desc = "a &" })

-- Terminal mode
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Left" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Down" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Right" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Up" })

-- Visual mode
map("v", ",.", "<C-U>", { desc = "Scroll up" })
map("v", ",/", "<C-D>", { desc = "Scroll down" })
map("v", "J", ":m '>+1<CR>gv-gv", { desc = "Move down" })
map("v", "K", ":m '<-2<CR>gv-gv", { desc = "Move up" })

-- Sideways plugin
map("n", "<A-h>", "<CMD>SidewaysLeft<CR>", { desc = "Move argument left" })
map("n", "<A-l>", "<CMD>SidewaysRight<CR>", { desc = "Move argument right" })
map("o", "aa", "<Plug>SidewaysArgumentTextobjA", { desc = "an argument" })
map("o", "ia", "<Plug>SidewaysArgumentTextobjI", { desc = "inner argument" })
map("x", "aa", "<Plug>SidewaysArgumentTextobjA", { desc = "an argument" })
map("x", "ia", "<Plug>SidewaysArgumentTextobjI", { desc = "inner argument" })

-- Substitute plugin
map("n", "cx", require("substitute.exchange").operator, { desc = "Exchange" })
map("n", "cxx", require("substitute.exchange").line, { desc = "Exchange line" })
map("n", "cxc", require("substitute.exchange").cancel, { desc = "Cancel exchange" })
map("x", "X", require("substitute.exchange").visual, { desc = "Cancel exchange" })

-- Leap plugin
map("n", "<Tab>", "<Plug>(leap-forward-to)", { desc = "2 character search" })
map("n", "<S-Tab>", "<Plug>(leap-backward-to)", { desc = "2 character search" })
map("n", "M", require("leap-ast").leap, { desc = "Leap to parent AST node" })
map("v", "<Tab>", "<Plug>(leap-forward-to)", { desc = "2 character search" })
map("v", "<S-Tab>", "<Plug>(leap-backward-to)", { desc = "2 character search" })
map("v", "M", require("leap-ast").leap, { desc = "Select AST node" })
map("o", "<Tab>", "<Plug>(leap-forward-to)", { desc = "2 character search" })
map("o", "<S-Tab>", "<Plug>(leap-backward-to)", { desc = "2 character search" })
map("o", "M", require("leap-ast").leap, { desc = "Parent AST node" })

-- Treehopper plugin
map("o", "m", ":<C-U>lua require('tsht').nodes()<CR>", { desc = "AST node" })
map("x", "m", ":lua require('tsht').nodes()<CR>", { desc = "Select AST node" })

-- TreeSJ plugin
map("n", ",cs", "<CMD>TSJSplit<CR>", { desc = "Split node" })
map("n", ",cj", "<CMD>TSJJoin<CR>", { desc = "Join node" })

-- Better wildmenu navigation
map(
  "c",
  "<C-j>",
  function() return vim.fn.wildmenumode() == 1 and "<C-n>" or "<C-j>" end,
  { expr = true, desc = "Wildmenu down" }
)
map(
  "c",
  "<Down>",
  function() return vim.fn.wildmenumode() == 1 and "<C-n>" or "<Down>" end,
  { expr = true, desc = "Wildmenu down" }
)
map(
  "c",
  "<C-k>",
  function() return vim.fn.wildmenumode() == 1 and "<C-p>" or "<C-k>" end,
  { expr = true, desc = "Wildmenu up" }
)
map(
  "c",
  "<Up>",
  function() return vim.fn.wildmenumode() == 1 and "<C-p>" or "<Up>" end,
  { expr = true, desc = "Wildmenu up" }
)

-- Redirect output to noice
map("c", "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, { desc = "Redirect Cmdline" })

-- Command-line mode
map("c", "<S-Insert>", "<C-R><C-R>+", { desc = "Paste from system clipboard" })
