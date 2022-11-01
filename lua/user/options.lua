vim.g.neovide_no_idle = true
vim.g.neovide_refresh_rate = 120
vim.g.neovide_cursor_vfx_mode = ""
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_remember_window_size = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.sort_motion_flags = "i"

vim.cmd("highlight link FloatBorder Normal")
vim.cmd("highlight link NormalFloat Normal")

-- if vim.fn.exists(":GuiFont") == 0 then
--   vim.opt.guifont = "JetBrainsMono NFM:h9.5"
-- end

vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect" }
-- vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ffs = { "unix", "dos" }
vim.opt.fileformat = "unix"
vim.opt.fileencoding = "utf-8"
vim.opt.foldlevel = 99
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.ignorecase = true
vim.opt.iskeyword:append("-")
vim.opt.laststatus = 2
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.pumheight = 0
-- vim.opt.relativenumber = true
vim.opt.report = 1000
vim.opt.scrolloff = 8
vim.opt.selection = "inclusive"
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("cI")
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = -1
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.title = false
vim.opt.updatetime = 1000
vim.opt.virtualedit:append("block")
vim.opt.winblend = 10
vim.opt.wrap = false
vim.opt.writebackup = false

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
