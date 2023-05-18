local which_key = require("which-key")

which_key.setup({
  plugins = {
    spelling = {
      enabled = true,
    },
  },
  popup_mappings = {
    scroll_down = "<C-j>",
    scroll_up = "<C-k>",
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
    winblend = 10,
  },
  hidden = { "<silent>", "<CMD>", "<CMD>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = false,
  show_keys = false,
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

local r = which_key.register

-- Space
r({
  c = { "<CMD>Bdelete!<CR>", "Close buffer" },
  C = { "<CMD>:e " .. vim.fn.stdpath("config") .. "/init.lua<CR>", "Edit configuration" },
  e = { "<CMD>Neotree toggle<CR>", "File explorer" },
  E = { "<CMD>Neotree reveal<CR>", "Find file in explorer" },
  q = { "<CMD>q<CR>", "Quit" },
  Q = { "<CMD>qa!<CR>", "Quit all without saving" },
  w = { "<CMD>w!<CR>", "Save" },

  f = {
    name = "Find",
    a = { "<CMD>Telescope<CR>", "All" },
    b = { "<CMD>Telescope buffers<CR>", "Buffers" },
    c = { "<CMD>Telescope commands<CR>", "Commands" },
    h = { "<CMD>Telescope help_tags<CR>", "Help" },
    f = { "<CMD>Telescope find_files<CR>", "Files" },
    g = { "<CMD>Telescope git_branches<CR>", "Git branches" },
    k = { "<CMD>Telescope keymaps<CR>", "Keymaps" },
    n = { "<CMD>Noice telescope<CR>", "Noice" },
    M = { "<CMD>Telescope man_pages<CR>", "Man pages" },
    p = { "<CMD>Telescope projects<CR>", "Projects" },
    r = { "<CMD>Telescope oldfiles<CR>", "Recent files" },
    R = { "<CMD>Telescope registers<CR>", "Registers" },
    s = { "<CMD>Telescope symbols<CR>", "Symbols" },
    t = { "<CMD>Telescope live_grep<CR>", "Text" },
    u = { "<CMD>Telescope undo<CR>", "Undo" },
    z = {
      function()
        require("telescope").extensions.z.list({ cmd = { vim.o.shell, "-c", "zoxide query -ls" } })
      end,
      "Zoxide",
    },
    ["."] = { "<CMD>Telescope file_browser<CR>", "Browse files" },
  },

  g = {
    name = "Git",
    b = { "<CMD>Telescope git_branches<CR>", "Checkout branch" },
    c = { "<CMD>Telescope git_commits<CR>", "Checkout commit" },
    d = { "<CMD>Gitsigns diffthis HEAD<CR>", "Diff" },
    g = { "<CMD>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<CMD>lua require('gitsigns').next_hunk()<CR>", "Next hunk" },
    k = { "<CMD>lua require('gitsigns').prev_hunk()<CR>", "Prev hunk" },
    l = { "<CMD>lua require('gitsigns').blame_line()<CR>", "Blame" },
    o = { "<CMD>Telescope git_status<CR>", "Open changed file" },
    p = { "<CMD>lua require('gitsigns').preview_hunk()<CR>", "Preview hunk" },
    r = { "<CMD>lua require('gitsigns').reset_hunk()<CR>", "Reset hunk" },
    R = { "<CMD>lua require('gitsigns').reset_buffer()<CR>", "Reset buffer" },
    s = { "<CMD>lua require('gitsigns').stage_hunk()<CR>", "Stage hunk" },
    u = { "<CMD>lua require('gitsigns').undo_stage_hunk()<CR>", "Undo stage hunk" },
  },

  l = {
    i = { "<CMD>LspInfo<CR>", "LSP info" },
    I = { "<CMD>Mason<CR>", "Mason installer info" },
  },

  p = {
    p = { "<CMD>Lazy sync<CR>", "Lazy sync" },
  },

  t = {
    name = "Terminal",
    f = { "<CMD>lua _TERMINAL_TOGGLE()<CR>", "Float" },
    h = { "<CMD>lua _TERMINAL_HORIZONTAL_TOGGLE()<CR>", "Horizontal" },
    m = { "<CMD>lua _MC_TOGGLE()<CR>", "Midnight Commander" },
    p = { "<CMD>lua _PYTHON_TOGGLE()<CR>", "Python" },
    v = { "<CMD>lua _TERMINAL_VERTICAL_TOGGLE()<CR>", "Vertical" },
  },
}, {
  mode = "n",
  prefix = "<leader>",
})

-- Normal mode
r({
  ["<C-S-t>"] = { "<CMD>tabnew<CR>", "Open new tab" },
  ["<C-F4>"] = { "<CMD>tabclose<CR>", "Close tab" },
  ["<C-S-h>"] = { "gT", "Previous tab" },
  ["<C-S-l>"] = { "gt", "Next tab" },
  ["<C-S-=>"] = { "<CMD>tabnew<CR>", "Open new tab" },
  ["<C-S-_>"] = { "<CMD>tabclose<CR>", "Close tab" },

  ["<C-Up>"] = { "<CMD>resize -2<CR>", "Resize window -2" },
  ["<C-Down>"] = { "<CMD>resize +2<CR>", "Resize window +2" },
  ["<C-Left>"] = { "<CMD>vertical resize -2<CR>", "Vertical resize window -2" },
  ["<C-Right>"] = { "<CMD>vertical resize +2<CR>", "Vertical resize window +2" },

  ["<C-h>"] = { "<C-W>h", "Left one window" },
  ["<C-j>"] = { "<C-W>j", "Up one window" },
  ["<C-k>"] = { "<C-W>k", "Down one window" },
  ["<C-l>"] = { "<C-W>l", "Right one window" },

  ["<S-h>"] = { "<CMD>bprevious<CR>", "Previous buffer" },
  ["<S-l>"] = { "<CMD>bnext<CR>", "Next buffer" },

  ["Y"] = { "_y$", "Yank line character-wise without indent" },
  ["`"] = { '"=nr2char(getchar())<CR>P', "Insert one character" },
  ["<BS>"] = { "<CMD>noh<return>", "Clear search highlighting" },
  ["<S-Insert>"] = { '"+P', "Paste from system clipboard" },
  [",p"] = { '"+p', "Paste from system clipboard" },
  [",P"] = { '"+P', "Paste from system clipboard" },
  [",r"] = { "<C-R>", "Redo last change" },
  [",vb"] = { "<C-V>", "Visual block mode" },

  [",."] = { "<C-U>", "Scroll up" },
  [",/"] = { "<C-D>", "Scroll down" },
  [",]"] = { "<C-]>", "Jump to tag" },
  [",["] = { "<C-T>", "Pop tag from stack" },
  [",lD"] = { "[<C-D>", "Jump to first macro definition of word" },
  [",ld"] = { "]<C-D>", "Jump to next macro definition of word" },
  [",lI"] = { "[<C-I>", "Jump to first line containing word" },
  [",li"] = { "]<C-I>", "Jump to next line containing word" },

  [",w"] = { name = "Window" },
  [",w,"] = { "<C-W>-", "Decrease window height" },
  [",w."] = { "<C-W>+", "Increase window height" },
  [",w<lt>"] = { "<C-W><lt>", "Decrease window width" },
  [",w>"] = { "<C-W>>", "Increase window width" },
  [",w<Bar>"] = { "<C-W><bar>", "Maximize window width" },
  [",w="] = { "<C-W>=", "Make windows equally high and wide" },
  [",wH"] = { "<C-W>H", "Move current window to left" },
  [",wJ"] = { "<C-W>J", "Move current window to bottom" },
  [",wK"] = { "<C-W>K", "Move current window to top" },
  [",wL"] = { "<C-W>L", "Move current window to right" },
  [",wR"] = { "<C-W>R", "Rotate windows upwards/leftwards" },
  [",w_"] = { "<C-W>_", "Maximize window height" },
  [",wa"] = { "<C-^>", "Edit alternate buffer in current window" },
  [",wc"] = { "<C-W>c", "Close current window" },
  [",wh"] = { "<C-W>h", "Left one window" },
  [",wj"] = { "<C-W>j", "Up one window" },
  [",wk"] = { "<C-W>k", "Down one window" },
  [",wl"] = { "<C-W>l", "Right one window" },
  [",wn"] = { "<C-W><C-W>", "Next window" },
  [",wo"] = { "<C-W>o", "Make current window the only one" },
  [",wp"] = { "<C-W>W", "Previous window" },
  [",wr"] = { "<C-W>r", "Rotate windows downwards/rightwards" },
  [",wx"] = { "<C-W>x", "Exchange current window with next" },
  [",w]"] = { "<C-W>]", "Go to identifier in split" },
  -- [",x12"] = { ":%s/\\n//g<CR>:%s/\\~/\\~\\r/g<CR>gg:nohlsearch<CR>", "Format X12 file" },
  [",x12"] = { ":%!x12pp<CR>:set ft=x12<CR>", "Format X12 file" },
  [",cd"] = { ":cd %:h<CR>", "Change current working directory to current file directory" },

  ["[c"] = { "<CMD>lua require('gitsigns').prev_hunk()<CR>", "Previous change" },
  ["]c"] = { "<CMD>lua require('gitsigns').next_hunk()<CR>", "Next change" },

  -- ["[<Space>"] = { "O<Esc>j", "Insert empty line above" },
  -- ["]<Space>"] = { "o<Esc>k", "Insert empty line below" },

  ["<A-1>"] = { "<CMD>Neotree toggle reveal_force_cwd<CR>", "File Explorer" },
  ["<A-2>"] = { "<CMD>Neotree toggle show buffers<CR>", "Buffer Explorer" },
  ["<F1>"] = { "<CMD>Telescope help_tags<CR>", "Help" },

  ["<leader>pb"] = { 'a <C-R>" <Esc>', "Paste after cursor and add space at both ends" },
  ["<leader>pe"] = { 'a<C-R>" <Esc>', "Paste after cursor and add space at end" },
  ["<leader>ps"] = { 'a <C-R>"<Esc>', "Paste after cursor and add space at start" },
  ["<leader>Pb"] = { 'i <C-R>" <Esc>', "Paste before cursor and add space at both ends" },
  ["<leader>Pe"] = { 'i<C-R>" <Esc>', "Paste before cursor and add space at end" },
  ["<leader>Ps"] = { 'i <C-R>"<Esc>', "Paste before cursor and add space at start" },
}, { mode = "n" })

-- Insert mode
r({
  ["<Esc>"] = { "<Esc>`^", "Exit insert mode" },
  ["jj"] = { "<Esc>", "Exit insert mode", noremap = false },
  ["<S-Enter>"] = { "<Esc>m`o<Esc>``a", "Insert blank line below" },
  ["<C-S-Enter>"] = { "<Esc>m`O<Esc>``a", "Insert blank line above" },
  ["<S-Insert>"] = { '<C-O>"+P', "Paste from system clipboard" },
  ["<S-Tab>"] = { "<C-D>", "Unindent line" },
  ["<F1>"] = { "<CMD>Telescope help_tags<CR>", "Help" },
  ["<C-Backspace>"] = { "<C-\\><C-O>dB", "Delete until the previous space" },
}, { mode = "i" })

-- Visual and select mode
r({
  -- [";;"] = { "<Esc>", "Exit visual mode" },
  ["<lt>"] = { "<lt>gv", "Decrease indent" },
  [">"] = { ">gv", "Increase indent" },
  ["al"] = { ":<C-u>normal! 0v$<CR>", "Yank a line" },
  ["il"] = { ":<C-u>normal! ^vg_<CR>", "Yank inner line" },
  ["p"] = { '"_dP', "Paste" },
  [",sl"] = { ":sort i<CR>", "Sort lines" },
  [",sn"] = { ":sort in<CR>", "Sort lines by number" },
  [",su"] = { ":sort iu<CR>", "Sort lines unique" },
  [",y"] = { '"+y', "Yank to system clipboard" },
  ["<C-Insert>"] = { '"+y', "Yank to system clipboard" },
  ["<S-Insert>"] = { '"+P', "Paste from system clipboard" },
}, { mode = "v" })

-- Operator pending mode
r({
  ["il"] = { "<CMD>normal! vil<CR>", "inner line" },
  ["al"] = { "<CMD>normal! val<CR>", "a line" },
  ["i/"] = { "<CMD>normal! T/vt/<CR>", "inner /" },
  ["a/"] = { "<CMD>normal! F/vt/<CR>", "a /" },
  ["i,"] = { "<CMD>normal! T,vt,<CR>", "inner ," },
  ["a,"] = { "<CMD>normal! F,vt,<CR>", "a ," },
  ["i."] = { "<CMD>normal! T.vt.<CR>", "inner ." },
  ["a."] = { "<CMD>normal! F.vt.<CR>", "a ." },
  ["i_"] = { "<CMD>normal! T_vt_<CR>", "inner _" },
  ["a_"] = { "<CMD>normal! F_vt_<CR>", "a _" },
  ["i-"] = { "<CMD>normal! T-vt-<CR>", "inner -" },
  ["a-"] = { "<CMD>normal! F-vt-<CR>", "a -" },
  ["i%"] = { "<CMD>normal! T%vt%<CR>", "inner %" },
  ["a%"] = { "<CMD>normal! F%vt%<CR>", "a %" },
  ["i="] = { "<CMD>normal! T=vt=<CR>", "inner =" },
  ["a="] = { "<CMD>normal! F=vt=<CR>", "a =" },
  ["i?"] = { "<CMD>normal! T?vt?<CR>", "inner ?" },
  ["a?"] = { "<CMD>normal! F?vt?<CR>", "a ?" },
  ["i!"] = { "<CMD>normal! T!vt!<CR>", "inner !" },
  ["a!"] = { "<CMD>normal! F!vt!<CR>", "a !" },
  ["i&"] = { "<CMD>normal! T&vt&<CR>", "inner &" },
  ["a&"] = { "<CMD>normal! F&vt&<CR>", "a &" },
}, { mode = "o" })

-- Terminal mode
r({
  ["<C-h>"] = { "<C-\\><C-N><C-w>h", "Left" },
  ["<C-j>"] = { "<C-\\><C-N><C-w>j", "Down" },
  ["<C-l>"] = { "<C-\\><C-N><C-w>l", "Right" },
  ["<C-k>"] = { "<C-\\><C-N><C-w>k", "Up" },
}, { mode = "t" })

-- Visual mode
r({
  [",."] = { "<C-U>", "Scroll up" },
  [",/"] = { "<C-D>", "Scroll down" },
  ["J"] = { ":m '>+1<CR>gv-gv", "Move down" },
  ["K"] = { ":m '<-2<CR>gv-gv", "Move up" },
}, { mode = "x" })

-- Sideways plugin
r({
  ["<A-h>"] = { "<CMD>SidewaysLeft<CR>", "Move argument left" },
  ["<A-l>"] = { "<CMD>SidewaysRight<CR>", "Move argument right" },
}, { mode = "n" })
r({
  ["aa"] = { "<Plug>SidewaysArgumentTextobjA", "an argument" },
  ["ia"] = { "<Plug>SidewaysArgumentTextobjI", "inner argument" },
}, { mode = "o" })
r({
  ["aa"] = { "<Plug>SidewaysArgumentTextobjA", "an argument" },
  ["ia"] = { "<Plug>SidewaysArgumentTextobjI", "inner argument" },
}, { mode = "x" })

-- Substitute plugin
r({
  ["cx"] = { "<CMD>lua require('substitute.exchange').operator()<CR>", "Exchange" },
  ["cxx"] = { "<CMD>lua require('substitute.exchange').line()<CR>", "Exchange line" },
  ["cxc"] = { "<CMD>lua require('substitute.exchange').cancel()<CR>", "Cancel exchange" },
}, { mode = "n" })
r({
  ["X"] = { "<CMD>lua require('substitute.exchange').visual()<CR>", "Cancel exchange" },
}, { mode = "x" })

-- Leap plugin
r({
  ["<Tab>"] = { "<Plug>(leap-forward-to)", "2 character search" },
  ["<S-Tab>"] = { "<Plug>(leap-backward-to)", "2 character search" },
  ["M"] = { "<CMD>lua require('leap-ast').leap()<CR>", "Leap to parent AST node" },
}, { mode = "n" })
r({
  ["<Tab>"] = { "<Plug>(leap-forward-to)", "2 character search" },
  ["<S-Tab>"] = { "<Plug>(leap-backward-to)", "2 character search" },
  ["M"] = { "<CMD>lua require('leap-ast').leap()<CR>", "Select AST node" },
}, { mode = "v" })
r({
  ["<Tab>"] = { "<Plug>(leap-forward-to)", "2 character search" },
  ["<S-Tab>"] = { "<Plug>(leap-backward-to)", "2 character search" },
  ["M"] = { "<CMD>lua require('leap-ast').leap()<CR>", "Parent AST node" },
}, { mode = "o" })

-- Treehopper plugin
r({
  ["m"] = { ":<C-U>lua require('tsht').nodes()<CR>", "AST node" },
}, { mode = "o", noremap = false })
r({
  ["m"] = { ":lua require('tsht').nodes()<CR>", "Select AST node" },
}, { mode = "x" })

-- TreeSJ plugin
r({
  [",cs"] = { "<CMD>TSJSplit<CR>", "Split node" },
  [",cj"] = { "<CMD>TSJJoin<CR>", "Join node" },
}, { mode = "n" })

-- Better wildmenu navigation
vim.keymap.set("c", "<C-j>", function()
  return vim.fn.wildmenumode() == 1 and "<C-n>" or "<C-j>"
end, { expr = true, desc = "Wildmenu down" })
vim.keymap.set("c", "<Down>", function()
  return vim.fn.wildmenumode() == 1 and "<C-n>" or "<Down>"
end, { expr = true, desc = "Wildmenu down" })
vim.keymap.set("c", "<C-k>", function()
  return vim.fn.wildmenumode() == 1 and "<C-p>" or "<C-k>"
end, { expr = true, desc = "Wildmenu up" })
vim.keymap.set("c", "<Up>", function()
  return vim.fn.wildmenumode() == 1 and "<C-p>" or "<Up>"
end, { expr = true, desc = "Wildmenu up" })

-- Redirect output to noice
vim.keymap.set("c", "<S-Enter>", function()
  require("noice").redirect(vim.fn.getcmdline())
end, { desc = "Redirect Cmdline" })

-- Command-line mode
vim.keymap.set("c", "<S-Insert>", "<C-R><C-R>+", { desc = "Paste from system clipboard" })
