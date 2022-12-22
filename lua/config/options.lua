vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_vfx_mode = ""
vim.g.neovide_no_idle = true
vim.g.neovide_refresh_rate = 120
vim.g.neovide_remember_window_size = true
vim.g.sort_motion_flags = "i"

if vim.fn.exists("g:neovide") ~= 0 then vim.opt.guifont = "JetBrainsMono NFM:h9.5" end

vim.opt.autowrite = true
vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
vim.opt.cmdheight = 1
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ffs = { "unix", "dos" }
vim.opt.fileformat = "unix"
vim.opt.fileencoding = "utf-8"
vim.opt.foldlevel = 99
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.ignorecase = true
vim.opt.iskeyword:append("-")
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.pumblend = 10
vim.opt.pumheight = 15
-- vim.opt.relativenumber = true
vim.opt.report = 1000
vim.opt.scrolloff = 8
vim.opt.selection = "inclusive"
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.shortmess:append("cI")
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = -1
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.title = false
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200
vim.opt.virtualedit:append("block")
vim.opt.wildmode = "longest:full,full"
vim.opt.winblend = 10
vim.opt.wrap = false
vim.opt.writebackup = false

-- Don't load the plugins below
local builtins = {
  "gzip",
  "zip",
  "zipPlugin",
  "fzf",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "matchit",
  "matchparen",
  "logiPat",
  "rrhelper",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
}

for _, plugin in ipairs(builtins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Use proper syntax highlighting in code blocks
local fences = {
  "lua",
  -- "vim",
  "json",
  "typescript",
  "javascript",
  "js=javascript",
  "ts=typescript",
  "shell=sh",
  "python",
  "sh",
  "console=sh",
}
vim.g.markdown_fenced_languages = fences
vim.g.markdown_recommended_style = 0