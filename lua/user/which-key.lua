local util = require("user.util")

local which_key = util.safe_require("which-key")
if not which_key then return end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Space keybindings
r({
  c = { "<CMD>Bdelete!<CR>", "Close buffer" },
  C = { "<CMD>:e " .. vim.fn.stdpath("config") .. "/init.lua<CR>", "Edit configuration" },
  e = { "<CMD>Neotree toggle<CR>", "File explorer" },
  E = { "<CMD>Neotree reveal<CR>", "Find file in explorer" },
  q = { "<CMD>q<CR>", "Quit" },
  Q = { "<CMD>q!<CR>", "Quit without saving" },
  w = { "<CMD>w!<CR>", "Save" },

  p = {
    name = "Packer",
    c = { "<CMD>PackerCompile<CR>", "Compile" },
    i = { "<CMD>PackerInstall<CR>", "Install" },
    s = { "<CMD>PackerSync<CR>", "Sync" },
    S = { "<CMD>PackerStatus<CR>", "Status" },
    u = { "<CMD>PackerUpdate<CR>", "Update" },
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
    name = "LSP",
    a = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "Code action" },
    ["C1"] = { "<CMD>lua =vim.lsp.get_active_clients()[1]<CR>", "View LSP server 1 information" },
    ["C2"] = { "<CMD>lua =vim.lsp.get_active_clients()[2]<CR>", "View LSP server 2 information" },
    ["C3"] = { "<CMD>lua =vim.lsp.get_active_clients()[3]<CR>", "View LSP server 3 information" },
    d = { "<CMD>Telescope diagnostics bufnr=0<CR>", "Document diagnostics" },
    w = { "<CMD>Telescope diagnostics<CR>", "Workspace diagnostics" },
    f = { "<CMD>lua vim.lsp.buf.format({ async = true })<CR>", "Format" },
    i = { "<CMD>LspInfo<CR>", "LSP info" },
    I = { "<CMD>Mason<CR>", "Mason installer info" },
    j = { "<CMD>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic" },
    k = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Prev diagnostic" },
    l = { "<CMD>lua vim.lsp.codelens.run()<CR>", "Codelens action" },
    q = { "<CMD>lua vim.diagnostic.setloclist()<CR>", "Quickfix" },
    r = { "<CMD>lua vim.lsp.buf.rename()<CR>", "Rename" },
    R = { "<CMD>lua vim.lsp.buf.references()<CR>", "References" },
    s = { "<CMD>Telescope lsp_document_symbols<CR>", "Document symbols" },
    S = { "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace symbols" },
  },

  f = {
    name = "Find",
    a = { "<CMD>Telescope<CR>", "All" },
    b = { "<CMD>Telescope buffers<CR>", "Buffers" },
    c = { "<CMD>Telescope commands<CR>", "Commands" },
    h = { "<CMD>Telescope help_tags<CR>", "Help" },
    f = { "<CMD>Telescope find_files<CR>", "Files" },
    g = { "<CMD>Telescope git_branches<CR>", "Git branches" },
    k = { "<CMD>Telescope keymaps<CR>", "Keymaps" },
    M = { "<CMD>Telescope man_pages<CR>", "Man pages" },
    P = { "<CMD>Telescope projects<CR>", "Projects" },
    r = { "<CMD>Telescope oldfiles<CR>", "Recent files" },
    R = { "<CMD>Telescope registers<CR>", "Registers" },
    t = { "<CMD>Telescope live_grep<CR>", "Text" },
  },

  t = {
    name = "Terminal",
    n = { "<CMD>lua _NODE_TOGGLE()<CR>", "Node" },
    u = { "<CMD>lua _NCDU_TOGGLE()<CR>", "NCDU" },
    t = { "<CMD>lua _HTOP_TOGGLE()<CR>", "Htop" },
    p = { "<CMD>lua _PYTHON_TOGGLE()<CR>", "Python" },
    f = { "<CMD>ToggleTerm direction=float<CR>", "Float" },
    h = { "<CMD>ToggleTerm size=10 direction=horizontal<CR>", "Horizontal" },
    v = { "<CMD>ToggleTerm size=80 direction=vertical<CR>", "Vertical" },
  },
}, {
  mode = "n",
  prefix = "<leader>",
})

-- Normal mode
r({
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

  ["<A-j>"] = { "<CMD>MoveLine(1)<CR>", "Move down" },
  ["<A-k>"] = { "<CMD>MoveLine(-1)<CR>", "Move up" },
  ["<S-A-h>"] = { "<CMD>MoveHChar(-1)<CR>", "Move character left" },
  ["<S-A-l>"] = { "<CMD>MoveHChar(1)<CR>", "Move character right" },

  ["Y"] = { "_y$", "Yank line character-wise without indent" },
  ["`"] = { "i <Esc>r", "Insert one character" },
  ["<BS>"] = { "<CMD>noh<return>", "Clear search highlighting" },
  ["<S-Insert>"] = { "\"+p", "Paste from system clipboard" },
  [",p"] = { "\"+p", "Paste from system clipboard" },
  [",P"] = { "\"+P", "Paste from system clipboard" },
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
  [",x12"] = { ":%s/\\n//g<CR>:%s/\\~/\\~\\r/g<CR>gg:nohlsearch<CR>", "Format X12 file" },
  [",cd"] = { ":cd %:h<CR>", "Change current working directory to current file directory" },

  [",xx"] = { "<CMD>TroubleToggle<CR>", "Toggle trouble" },
  [",xw"] = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "Toggle workspace diagnostics" },
  [",xd"] = { "<CMD>TroubleToggle document_diagnostics<CR>", "Toggle document diagnostics" },
  [",xl"] = { "<CMD>TroubleToggle loclist<CR>", "Toggle loc list" },
  [",xq"] = { "<CMD>TroubleToggle quickfix<CR>", "Toggle quickfix" },
  ["gR"] = { "<CMD>TroubleToggle lsp_references<CR>" },

  ["[c"] = { "<CMD>lua require('gitsigns').prev_hunk()<CR>", "Previous change" },
  ["]c"] = { "<CMD>lua require('gitsigns').next_hunk()<CR>", "Next change" },

  -- ["[<Space>"] = { "O<Esc>j", "Insert empty line above" },
  -- ["]<Space>"] = { "o<Esc>k", "Insert empty line below" },

  ["<A-1>"] = { "<CMD>Neotree toggle<CR>", "File Explorer" },
  ["<F1>"] = { "<CMD>Telescope help_tags<CR>", "Help" },
}, { mode = "n" })

-- Insert mode
r({
  ["<Esc>"] = { "<Esc>`^", "Exit insert mode" },
  ["jj"] = { "<Esc>", "Exit insert mode", noremap = false },
  ["<S-Insert>"] = { "<C-R>+", "Paste from system clipboard" },
  ["<F1>"] = { "<CMD>Telescope help_tags<CR>", "Help" },
}, { mode = "i" })

-- Visual and select mode
r({
  [";;"] = { "<Esc>", "Exit visual mode" },
  ["<lt>"] = { "<lt>gv", "Decrease indent" },
  [">"] = { ">gv", "Increase indent" },
  ["al"] = { ":<C-u>norm!0v$<CR>", "Yank a line" },
  ["il"] = { ":<C-u>norm!^vg_<CR>", "Yank inner line" },
  ["<A-j>"] = { "<CMD>MoveBlock(1)<CR>", "Move block down" },
  ["<A-k>"] = { "<CMD>MoveBlock(-1)<CR>", "Move block up" },
  ["<A-h>"] = { "<CMD>MoveHBlock(-1)<CR>", "Move block left" },
  ["<A-l>"] = { "<CMD>MoveHBlock(1)<CR>", "Move block right" },
  -- ["p"] = { '"_dP', "Paste" },
  [",sl"] = { ":sort i<CR>", "Sort lines" },
  [",su"] = { ":sort iu<CR>", "Sort lines unique" },
  [",sn"] = { ":sort in<CR>", "Sort lines by number" },
  [",y"] = { "\"+y", "Yank to system clipboard" },
  ["<C-Insert>"] = { "\"+y", "Yank to system clipboard" },
  ["<S-Insert>"] = { "\"+P", "Paste from system clipboard" },
}, { mode = "v" })

-- Operator pending mode
r({
  ["il"] = { "<CMD>norm vil<CR>", "inner line" },
  ["al"] = { "<CMD>norm val<CR>", "a line" },
  ["i/"] = { "<CMD>norm T/vt/<CR>", "inner /" },
  ["a/"] = { "<CMD>norm F/vt/<CR>", "a /" },
  ["i,"] = { "<CMD>norm T,vt,<CR>", "inner ," },
  ["a,"] = { "<CMD>norm F,vt,<CR>", "a ," },
  ["i."] = { "<CMD>norm T.vt.<CR>", "inner ." },
  ["a."] = { "<CMD>norm F.vt.<CR>", "a ." },
  ["i_"] = { "<CMD>norm T_vt_<CR>", "inner _" },
  ["a_"] = { "<CMD>norm F_vt_<CR>", "a _" },
  ["i-"] = { "<CMD>norm T-vt-<CR>", "inner -" },
  ["a-"] = { "<CMD>norm F-vt-<CR>", "a -" },
  ["i%"] = { "<CMD>norm T%vt%<CR>", "inner %" },
  ["a%"] = { "<CMD>norm F%vt%<CR>", "a %" },
  ["i="] = { "<CMD>norm T=vt=<CR>", "inner =" },
  ["a="] = { "<CMD>norm F=vt=<CR>", "a =" },
  ["i?"] = { "<CMD>norm T?vt?<CR>", "inner ?" },
  ["a?"] = { "<CMD>norm F?vt?<CR>", "a ?" },
  ["i!"] = { "<CMD>norm T!vt!<CR>", "inner !" },
  ["a!"] = { "<CMD>norm F!vt!<CR>", "a !" },
  ["i&"] = { "<CMD>norm T&vt&<CR>", "inner &" },
  ["a&"] = { "<CMD>norm F&vt&<CR>", "a &" },
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
  ["<A-j>"] = { ":m '>+1<CR>gv-gv", "Move down" },
  ["<A-k>"] = { ":m '<-2<CR>gv-gv", "Move up" },
}, { mode = "x" })

-- Sideways plugin mappings
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

-- Substitute plugin mappings
r({
  ["cx"] = { "<CMD>lua require('substitute.exchange').operator()<CR>", "Exchange" },
  ["cxx"] = { "<CMD>lua require('substitute.exchange').line()<CR>", "Exchange line" },
  ["cxc"] = { "<CMD>lua require('substitute.exchange').cancel()<CR>", "Cancel exchange" },
}, { mode = "n" })
r({
  ["X"] = { "<CMD>lua require('substitute.exchange').visual()<CR>", "Cancel exchange" },
}, { mode = "x" })

-- Leap plugin mappings
r({
  ["<Tab>"] = { "<Plug>(leap-forward-to)", "2 character search" },
  ["<S-Tab>"] = { "<Plug>(leap-backward-to)", "2 character search" },
}, { mode = "n" })
r({
  ["<Tab>"] = { "<Plug>(leap-forward-to)", "2 character search" },
  ["<S-Tab>"] = { "<Plug>(leap-backward-to)", "2 character search" },
}, { mode = "v" })
r({
  ["<Tab>"] = { "<Plug>(leap-forward-to)", "2 character search" },
  ["<S-Tab>"] = { "<Plug>(leap-backward-to)", "2 character search" },
}, { mode = "o" })

-- LSP mappings
r({
  ["gD"] = { "<CMD>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
  ["gd"] = { "<CMD>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
  ["K"] = { "<CMD>lua vim.lsp.buf.hover()<CR>", "Show information" },
  ["gi"] = { "<CMD>lua vim.lsp.buf.implementation()<CR>", "List all implementations" },
  ["gl"] = { "<CMD>lua vim.diagnostic.open_float()<CR>", "Show diagnostics" },
  ["[d"] = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Go to previous diagnostic" },
  ["]d"] = { "<CMD>lua vim.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
  ["<A-Enter>"] = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "Code action" },
}, { mode = "n" })
