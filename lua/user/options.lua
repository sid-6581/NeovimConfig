-- Windows-specific
if vim.fn.has("win32") == 1 then
  vim.cmd([[
    " set shell=pwsh\ -NoLogo\ -NoProfile
    " set shellcmdflag=-Command
    " set shellquote=\"
    " set shellxquote=
    source $VIMRUNTIME/mswin.vim
  ]])
end

local options = {
  clipboard = "unnamedplus",                -- Allows neovim to access the system clipboard
  cmdheight = 2,                            -- More space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" },  -- Mostly just for cmp
  cursorline = true,                        -- Highlight the current line
  expandtab = true,                         -- Convert tabs to spaces
  ffs = { "unix", "dos" },                  -- Prefer editing files as unix files, allow dos
  fileformat = "unix",                      -- Start off editing files in unix format
  fileencoding = "utf-8",                   -- The encoding written to a file
  guifont = "MesloLGS NF:h10",              -- The font used in graphical neovim applications
  ignorecase = true,                        -- Ignore case in search patterns
  mouse = "a",                              -- Allow the mouse to be used in neovim
  number = true,                            -- Set numbered lines
  numberwidth = 4,                          -- Set number column width
  pumheight = 10,                           -- Pop up menu height
  scrolloff = 8,                            -- Vertical scroll offset
  selection = "inclusive",                  -- Include last character of selection
  shiftwidth = 2,                           -- The number of spaces inserted for each indentation
  showmode = false,                         -- We don't need to see things like -- INSERT -- anymore
  showtabline = 2,                          -- Always show tabs
  sidescrolloff = 8,                        -- Horizontal scroll offset
  signcolumn = "yes",                       -- Always show the sign column, otherwise it would shift the text each time
  smartcase = true,                         -- Smart case
  smartindent = true,                       -- Make indenting smarter again
  splitbelow = true,                        -- Force all horizontal splits to go below current window
  splitright = true,                        -- Force all vertical splits to go to the right of current window
  swapfile = false,                         -- Creates a swapfile
  tabstop = 2,                              -- Number of spaces for a tab
  termguicolors = true,                     -- Set term gui colors (most terminals support this)
  timeoutlen = 100,                         -- Time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                         -- Faster completion (4000ms default)
  wrap = false,                             -- Display lines as one long line
  writebackup = false,                      -- Don't create backup files
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[
  set virtualedit+=block                    " Allow virtual editing in visual block mode
  set iskeyword+=-                          " Make - part of keywords
  set shortmess+=c                          " Turn off hit enter prompt for completion popup
  set formatoptions-=cro                    " Don't insert comments
]])

-- Neovide
vim.g.neovide_refresh_rate = 120
vim.g.neovide_cursor_vfx_mode = "railgun"

vim.g.argtextobj_pairs = "[:],(:),{:},<:>"

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.cmd "cd ~"
