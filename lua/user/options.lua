local o = vim.opt
local g = vim.g

pcall(vim.cmd.colorscheme, "gruvbox")

g.neovide_refresh_rate = 120
g.neovide_cursor_vfx_mode = ""
g.neovide_cursor_animation_length = 0
g.neovide_remember_window_size = true
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.cursorhold_updatetime = 100
g.lightspeed_no_default_keymaps = 1

if vim.fn.has("win32") == 1 then
  vim.cmd("source $VIMRUNTIME/mswin.vim")
end

vim.cmd("highlight link FloatBorder Normal")
vim.cmd("highlight link NormalFloat Normal")

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
o.title = true
o.updatetime = 300
o.virtualedit:append("block")
o.winblend = 10
o.wrap = false
o.writebackup = false

local map = vim.keymap.set

-- Better wildmenu navigation
map("c", "<C-j>", function()
  return vim.fn.wildmenumode() == 1 and "<C-n>" or "<C-j"
end, { expr = true })
map("c", "<C-k>", function()
  return vim.fn.wildmenumode() == 1 and "<C-p>" or "<C-k"
end, { expr = true })

vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 }) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]])
