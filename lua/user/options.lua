local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = false,                        -- disable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- number of spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "MesloLGS NF:h10",             -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[
  set virtualedit+=block
  set iskeyword+=-
  set shortmess+=c
  set whichwrap+=<,>,[,],h,l
  set formatoptions-=cro
]])

-- Windows-specific
if vim.fn.has("win32") == 1 then
  vim.cmd([[
    set shell=pwsh\ -NoLogo
    set shellcmdflag=-Command
    set shellquote=\"
    set shellxquote=
    source $VIMRUNTIME/mswin.vim
  ]])
end

-- Neovide
vim.g.neovide_refresh_rate = 140
vim.g.neovide_cursor_vfx_mode = "railgun"

vim.g.argtextobj_pairs = "[:],(:),{:},<:>"

vim.cmd "cd ~"
