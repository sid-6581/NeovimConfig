local o = vim.opt
local g = vim.g

if vim.fn.has("win32") == 1 then
  vim.cmd [[
    source $VIMRUNTIME/mswin.vim"
  ]]
end

o.clipboard = "unnamedplus"                 -- Allows neovim to access the system clipboard
o.cmdheight = 2                             -- More space in the neovim command line for displaying messages
o.completeopt = { "menuone", "noselect" }   -- Mostly just for cmp
o.cursorline = true                         -- Highlight the current line
o.expandtab = true                          -- Convert tabs to spaces
o.ffs = { "unix", "dos" }                   -- Prefer editing files as unix files, allow dos
o.fileencoding = "utf-8"                    -- The encoding written to a file
o.fileformat = "unix"                       -- Start off editing files in unix format
o.formatoptions:remove({"c", "r", "o"})     -- Don't insert comments
o.guifont = "MesloLGS NF:h10"               -- The font used in graphical neovim applications
o.ignorecase = true                         -- Ignore case in search patterns
o.iskeyword:append("-")                     -- Make - part of keywords
o.laststatus = 2                            -- Global statusline
o.mouse = "a"                               -- Allow the mouse to be used in neovim
o.number = true                             -- Set numbered lines
o.numberwidth = 4                           -- Set number column width
o.pumheight = 10                            -- Pop up menu height
o.scrolloff = 8                             -- Vertical scroll offset
o.selection = "inclusive"                   -- Include last character of selection
o.shiftwidth = 2                            -- The number of spaces inserted for each indentation
o.shortmess:append("c")                     -- Turn off hit enter prompt for completion popup
o.showmode = false                          -- We don't need to see things like -- INSERT -- anymore
o.showtabline = 2                           -- Always show tabs
o.sidescrolloff = 8                         -- Horizontal scroll offset
o.signcolumn = "yes"                        -- Always show the sign column, otherwise it would shift the text each time
o.smartcase = true                          -- Smart case
o.smartindent = true                        -- Make indenting smarter
o.softtabstop = -1                          -- Allow easy backspace over spaces
o.splitbelow = true                         -- Force all horizontal splits to go below current window
o.splitright = true                         -- Force all vertical splits to go to the right of current window
o.swapfile = false                          -- Creates a swapfile
o.tabstop = 2                               -- Number of spaces for a tab
o.termguicolors = true                      -- Set term gui colors (most terminals support this)
o.timeoutlen = 400                          -- Time to wait for a mapped sequence to complete (in milliseconds)
o.updatetime = 300                          -- Faster completion (4000ms default)
o.virtualedit:append("block")               -- Allow virtual editing in visual block mode
o.wrap = false                              -- Display lines as one long line
o.writebackup = false                       -- Don't create backup files

g.neovide_refresh_rate = 120
g.neovide_cursor_vfx_mode = "railgun"
g.argtextobj_pairs = "[:],(:),{:},<:>"
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

vim.cmd [[
  cd ~
]]
