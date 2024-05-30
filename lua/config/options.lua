if vim.fn.exists("g:neovide") ~= 0 then vim.opt.guifont = "JetBrainsMono\\ Nerd\\ Font\\ Mono:h9.5:#h-full" end
if vim.fn.exists("g:nvy") ~= 0 then vim.opt.guifont = "JetBrainsMono\\ Nerd\\ Font\\ Mono:h9.5" end

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.g.neovide_cursor_animation_length = 0
-- vim.g.neovide_cursor_vfx_mode = ""
vim.g.neovide_floating_shadow = false
-- vim.g.neovide_no_idle = true
-- vim.g.neovide_refresh_rate = 120
vim.g.neovide_remember_window_size = true
-- vim.g.neovide_scroll_animation_far_lines = 0
-- vim.g.neovide_underline_stroke_scale = 0.5
-- vim.g.neovide_unlink_border_highlights = false

vim.opt.autowrite = true
vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
vim.opt.breakindent = true
vim.opt.cmdheight = 1
vim.opt.completeopt = ""
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ffs = { "unix", "dos" }
vim.opt.fileencoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.fillchars:append({ stlnc = "", eob = " " })
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.iskeyword:append("-")
vim.opt.laststatus = 0
vim.opt.list = true
vim.opt.listchars:append({ space = "⋅", tab = "» ", extends = "…", precedes = "…", nbsp = "␣" })
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.previewheight = 20
vim.opt.pumblend = 0
vim.opt.pumheight = 15
vim.opt.redrawtime = 500
vim.opt.relativenumber = false
vim.opt.report = 1000
vim.opt.ruler = false
vim.opt.scrolloff = 8
vim.opt.selection = "inclusive"
vim.opt.shell = (vim.fn.has("win32") == 1) and "cmd.exe" or vim.opt.shell
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append({ c = true, I = true, s = true })
vim.opt.showcmd = false
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
vim.opt.title = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 250
vim.opt.virtualedit:append("block")
vim.opt.wildmode = { "longest", "list:full" }
vim.opt.winblend = 0
vim.opt.wrap = false
vim.opt.writebackup = false

vim.filetype.add({
  extension = {
    nomad = "hcl",
  },
})

-- Redirect all prints to vim.notify
---@diagnostic disable-next-line: missing-global-doc
print = function(...)
  local print_safe_args = {}
  local _ = { ... }
  for i = 1, #_ do
    table.insert(print_safe_args, tostring(_[i]))
  end
  vim.notify(table.concat(print_safe_args, " "), "info")
end
