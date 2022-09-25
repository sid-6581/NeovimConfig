local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

which_key.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<CR>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<C-j>", -- binding to scroll down inside the popup
    scroll_up = "<C-k>", -- binding to scroll up inside the popup
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
    winblend = 10,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

local r = which_key.register

-- Space keybindings
r({
  a = { "<cmd>Alpha<CR>", "Alpha" },
  b = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
    "Buffers",
  },
  e = { "<cmd>Neotree toggle<CR>", "File Explorer" },
  n = { "<cmd>Neotree reveal<CR>", "Find File in Explorer" },
  w = { "<cmd>w!<CR>", "Save" },
  q = { "<cmd>q!<CR>", "Quit" },
  c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  f = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
    "Find Files",
  },
  F = { "<cmd>Telescope live_grep theme=ivy<CR>", "Find Text" },
  P = { "<cmd>lua require('telescope').extensions.projects.projects()<CR>", "Projects" },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<CR>", "Compile" },
    i = { "<cmd>PackerInstall<CR>", "Install" },
    s = { "<cmd>PackerSync<CR>", "Sync" },
    S = { "<cmd>PackerStatus<CR>", "Status" },
    u = { "<cmd>PackerUpdate<CR>", "Update" },
  },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk" },
    o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
    d = { "<cmd>Gitsigns diffthis HEAD<CR>", "Diff" },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0<CR>", "Document Diagnostics" },
    w = { "<cmd>Telescope diagnostics<CR>", "Workspace Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format" },
    i = { "<cmd>LspInfo<CR>", "Info" },
    I = { "<cmd>Mason<CR>", "Mason Installer Info" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev Diagnostic" },
    l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Symbols" },
  },

  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
    M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
    R = { "<cmd>Telescope registers<CR>", "Registers" },
    k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
    C = { "<cmd>Telescope commands<CR>", "Commands" },
  },

  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<CR>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<CR>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<CR>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<CR>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<CR>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<CR>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<CR>", "Vertical" },
  },
}, {
  mode = "n",
  prefix = "<leader>",
})

-- Normal mode
r({
  ["<C-Up>"] = { "<cmd>resize -2<CR>", "Resize window -2" },
  ["<C-Down>"] = { "<cmd>resize +2<CR>", "Resize window +2" },
  ["<C-Left>"] = { "<cmd>vertical resize -2<CR>", "Vertical resize window -2" },
  ["<C-Right>"] = { "<cmd>vertical resize +2<CR>", "Vertical resize window +2" },

  ["<C-h>"] = { "<C-W>h", "Left one window" },
  ["<C-j>"] = { "<C-W>j", "Up one window" },
  ["<C-k>"] = { "<C-W>k", "Down one window" },
  ["<C-l>"] = { "<C-W>l", "Right one window" },

  ["<S-l>"] = { "<cmd>bnext<CR>", "Next buffer" },
  ["<S-h>"] = { "<cmd>bprevious<CR>", "Previous buffer" },

  ["<A-j>"] = { "<Esc><cmd>m .+1<CR>==", "Move line down" },
  ["<A-k>"] = { "<Esc><cmd>m .-2<CR>==", "Move line up" },

  ["Y"] = { "y$", "Yank to the end of the line" },
  ["`"] = { '<cmd>exe "normal i" . nr2char(getchar())<CR>', "Insert one character" },
  ["<bs>"] = { "<cmd>noh<return>", "Clear search highlighting" },
  [",o"] = { '<cmd>exe "normal O"<CR>', "Insert empty line above" },
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
  [",w<bar>"] = { "<C-W><bar>", "Maximize window width" },
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

  [",xx"] = { "<cmd>TroubleToggle<CR>", "Toggle trouble" },
  [",xw"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Toggle workspace diagnostics" },
  [",xd"] = { "<cmd>TroubleToggle document_diagnostics<CR>", "Toggle document diagnostics" },
  [",xl"] = { "<cmd>TroubleToggle loclist<CR>", "Toggle loc list" },
  [",xq"] = { "<cmd>TroubleToggle quickfix<CR>", "Toggle quickfix" },
  ["gR"] = { "<cmd>TroubleToggle lsp_references<CR>" },

  ["<A-1>"] = { "<cmd>Neotree toggle<CR>", "File Explorer" },
}, { mode = "n" })

-- Visual and select mode
r({
  ["<lt>"] = { "<lt>gv", "Decrease indent" },
  [">"] = { ">gv", "Increase indent" },
  ["al"] = { ":<C-u>norm!0v$<CR>", "Yank a line" },
  ["il"] = { ":<C-u>norm!^vg_<CR>", "Yank inner line" },
  ["<A-j>"] = { ":m .+1<CR>==", "Move block down" },
  ["<A-k>"] = { ":m .-2<CR>==", "Move block up" },
  ["p"] = { '"_dP', "Paste" },
}, { mode = "v" })

-- Operator pending mode
r({
  ["al"] = { "<cmd>norm val<CR>", "a line" },
  ["il"] = { "<cmd>norm vil<CR>", "inner line" },
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
  ["<A-h>"] = { "<cmd>SidewaysLeft<CR>", "Move argument left" },
  ["<A-l>"] = { "<cmd>SidewaysRight<CR>", "Move argument right" },
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
  ["cx"] = { "<cmd>lua require('substitute.exchange').operator()<CR>", "Exchange" },
  ["cxx"] = { "<cmd>lua require('substitute.exchange').line()<CR>", "Exchange line" },
  ["cxc"] = { "<cmd>lua require('substitute.exchange').cancel()<CR>", "Cancel exchange" },
}, { mode = "n" })
r({
  ["X"] = { "<cmd>lua require('substitute.exchange').visual()<CR>", "Cancel exchange" },
}, { mode = "x" })
