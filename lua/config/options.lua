vim.g.neovide_confirm_quit = false
vim.g.neovide_cursor_animation_length = 0.0
vim.g.neovide_cursor_vfx_mode = ""
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_position_animation_length = 0.0
vim.g.neovide_remember_window_size = true
vim.g.neovide_scroll_animation_far_lines = 0
vim.g.neovide_scroll_animation_length = 0.0
vim.g.neovide_floating_shadow = false
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.no_rust_maps = 1
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.autowrite = true
vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
vim.opt.breakindent = true
vim.opt.cmdheight = 0
vim.opt.completeopt = ""
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.diffopt:append({ "algorithm:histogram", "foldcolumn:0" })
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.fileformats = { "unix", "dos" }
vim.opt.fillchars:append({ eob = " ", diff = " " })
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true
vim.opt.iskeyword:append("-")
vim.opt.laststatus = 0
vim.opt.list = true
vim.opt.listchars:append({ space = " ", tab = "» ", extends = "…", precedes = "…", nbsp = "␣", trail = "⋅" })
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.previewheight = 20
vim.opt.pumheight = 15
vim.opt.redrawtime = 500
vim.opt.relativenumber = false
vim.opt.report = 1000
vim.opt.scrolloff = 10
vim.opt.shell = "nu"
vim.opt.shellcmdflag = "-c"
vim.opt.shellpipe = "| tee { save '%s' }"
vim.opt.shellquote = ""
vim.opt.shellredir = "| tee { save '%s' }"
vim.opt.shellxescape = ""
vim.opt.shellxquote = ""
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append({ c = true, I = true, s = true })
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.sidescrolloff = 10
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
vim.opt.title = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 250
vim.opt.virtualedit = { "block" }
vim.opt.wildmode = { "longest", "list:full" }
vim.opt.wildoptions = { "pum", "fuzzy" }
vim.opt.wrap = false
vim.opt.writebackup = false

vim.filetype.add({
  extension = {
    nomad = "hcl",
    props = "xml",
  },
})
