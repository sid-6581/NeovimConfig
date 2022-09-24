local o = vim.opt
local g = vim.g
local map = vim.keymap.set

if vim.fn.has("win32") == 1 then
  vim.cmd("source $VIMRUNTIME/mswin.vim")
end

vim.cmd("highlight link FloatBorder NormalFloat")

o.clipboard = "unnamedplus"
o.cmdheight = 1
o.completeopt = { "menuone", "noselect" }
o.cursorline = true
o.expandtab = true
o.ffs = { "unix", "dos" }
o.fileencoding = "utf-8"
o.fileformat = "unix"
o.foldlevel = 99
o.formatoptions:remove({ "c", "r", "o" })
o.guifont = "MesloLGS NF:h10"
o.ignorecase = true
o.iskeyword:append("-")
o.laststatus = 2
o.mouse = "a"
o.number = true
o.numberwidth = 4
o.pumheight = 0
o.scrolloff = 8
o.selection = "inclusive"
o.shiftwidth = 2
o.shortmess:append("c")
o.showmode = false
o.showtabline = 2
o.sidescrolloff = 8
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = true
o.softtabstop = -1
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.tabstop = 2
o.termguicolors = true
o.timeoutlen = 400
o.updatetime = 300
o.virtualedit:append("block")
o.winblend = 10
o.wrap = false
o.writebackup = false

g.neovide_refresh_rate = 120
g.neovide_cursor_vfx_mode = "railgun"
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.cursorhold_updatetime = 100

-- Better wildmenu navigation
map("c", "<C-j>", function()
  return vim.fn.wildmenumode() == 1 and "<C-n>" or "<C-j"
end, { expr = true })
map("c", "<C-k>", function()
  return vim.fn.wildmenumode() == 1 and "<C-p>" or "<C-k"
end, { expr = true })
