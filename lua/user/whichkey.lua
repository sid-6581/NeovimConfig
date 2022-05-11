local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local setup = {
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
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
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
}

which_key.setup(setup)

-- Space keybindings
which_key.register({
  a = { "<cmd>Alpha<cr>", "Alpha" },
  b = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },
  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  n = { "<cmd>NvimTreeFindFile<cr>", "Find File in Explorer" },
  w = { "<cmd>w!<CR>", "Save" },
  q = { "<cmd>q!<CR>", "Quit" },
  c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  f = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find Files",
  },
  F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  P = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope diagnostics bufnr=0<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
}, {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

-- Normal mode
which_key.register({
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

  ["\\\\"] = { "<cmd>HopChar2<CR>", "Hop 2 chars" },
  ["\\s"] = { "<cmd>HopChar2<CR>", "Hop 2 chars" },
  ["\\w"] = { "<cmd>HopWord<CR>", "Hop word" },
  ["\\f"] = { "<cmd>HopChar1CurrentLineAC<CR>", "Hop 1 char right" },
  ["\\F"] = { "<cmd>HopChar1CurrentLineBC<CR>", "Hop 1 char left" },

  ["Y"] = { "y$", "Yank to the end of the line" },
  ["`"] = { "<cmd>exe \"normal i\" . nr2char(getchar())<CR>", "Insert one character" },
  ["<bs>"] = { "<cmd>noh<return>", "Clear search highlighting" },
  [",o"] = { "<cmd>exe \"normal O\"<CR>", "Insert empty line above" },
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
}, {
  mode = "n",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

-- Visual and select mode
which_key.register({
  ["<lt>"] = { "<lt>gv", "Decrease indent" },
  [">"] = { ">gv", "Increase indent" },
  ["al"] = { ":<C-u>norm!0v$<CR>", "Yank a line" },
  ["il"] = { ":<C-u>norm!^vg_<CR>", "Yank inner line" },
  -- ["<A-j>"] = { ":m .+1<CR>==", "Move block down" },
  -- ["<A-k>"] = { ":m .-2<CR>==", "Move block up" },
  ["p"] = { '"_dP', "Paste" },
}, {
  mode = "v",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

-- Operator pending mode
which_key.register({
  ["al"] = { "<cmd>norm val<CR>", "a line" },
  ["il"] = { "<cmd>norm vil<CR>", "inner line" },
}, {
  mode = "o",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})

-- Terminal mode
which_key.register({
  ["<C-h>"] = { "<C-\\><C-N><C-w>h", "Left" },
  ["<C-j>"] = { "<C-\\><C-N><C-w>j", "Down" },
  ["<C-k>"] = { "<C-\\><C-N><C-w>k", "Up" },
  ["<C-l>"] = { "<C-\\><C-N><C-w>l", "Right" },
}, {
  mode = "t",
  buffer = nil,
  silent = true,
  noremap = false,
  nowait = true,
})

-- Visual mode
which_key.register({
  ["J"] = { ":m '>+1<CR>gv-gv", "Move down" },
  ["K"] = { ":m '<-2<CR>gv-gv", "Move up" },
  ["<A-j>"] = { ":m '>+1<CR>gv-gv", "Move down" },
  ["<A-k>"] = { ":m '<-2<CR>gv-gv", "Move up" },
}, {
  mode = "x",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
})
