vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_vfx_mode = ""
vim.g.neovide_no_idle = true
vim.g.neovide_refresh_rate = 120
vim.g.neovide_remember_window_size = true
vim.g.sort_motion_flags = "i"

if vim.fn.exists("g:neovide") ~= 0 then vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h9.5" end
if vim.fn.exists("g:nvy") ~= 0 then vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h9.5" end

vim.opt.autowrite = true
vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
vim.opt.breakindent = true
vim.opt.cmdheight = 0
vim.opt.completeopt = ""
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ffs = { "unix", "dos" }
vim.opt.fileencoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.fillchars:append("stlnc:")
vim.opt.fillchars:append("eob: ")
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.iskeyword:append("-")
vim.opt.laststatus = 0
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("tab:» ")
vim.opt.listchars:append("extends:…")
vim.opt.listchars:append("precedes:…")
vim.opt.listchars:append("nbsp:␣")
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.pumblend = 10
vim.opt.pumheight = 15
vim.opt.relativenumber = true
vim.opt.report = 1000
vim.opt.scrolloff = 8
vim.opt.selection = "inclusive"
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("cIs")
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = -1
vim.opt.splitbelow = true
vim.opt.splitkeep = "cursor"
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.title = false
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 250
vim.opt.virtualedit:append("block")
vim.opt.wildmode = "longest,list:full"
vim.opt.winblend = 10
vim.opt.wrap = false
vim.opt.writebackup = false

vim.filetype.add({
  extension = {
    nomad = "hcl",
  },
})

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
