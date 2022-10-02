local ensure_packer = function()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  ---@diagnostic disable-next-line: missing-parameter
  if vim.fn.empty(vim.fn.glob(install_path)) == 0 then return false end
  vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
  return true
end

local packer_bootstrap = ensure_packer()

local util = require("user.util")

local packer = util.safe_require("packer")
if not packer then return end

local packer_util = util.safe_require("packer.util")
if not packer_util then return end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

packer.init({
  compile_path = packer_util.join_paths(vim.fn.stdpath("data"), "site", "plugin", "packer_compiled.lua"),
  display = {
    open_fn = function()
      return packer_util.float({ border = "single" })
    end,
  },
  prompt_border = "single",
  autoremove = true,
})

packer.startup(function(use)
  -- Plugins that other things are more likely to depend on
  use("wbthomason/packer.nvim")
  use("lewis6991/impatient.nvim")
  use("nvim-lua/plenary.nvim")
  use("stevearc/dressing.nvim")
  use("MunifTanjim/nui.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("rcarriga/nvim-notify")
  use("s1n7ax/nvim-window-picker")
  use("nvim-telescope/telescope.nvim")

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  use("ahmedkhalf/project.nvim")
  use("akinsho/toggleterm.nvim")
  use("AndrewRadev/sideways.vim")
  use("b0o/schemastore.nvim")
  use("ellisonleao/gruvbox.nvim")
  use("folke/lua-dev.nvim")
  use("folke/trouble.nvim")
  use("folke/which-key.nvim")
  use("gbprod/substitute.nvim")
  use("gpanders/editorconfig.nvim")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-path")
  use("hrsh7th/nvim-cmp")
  use("jose-elias-alvarez/null-ls.nvim")
  use("kylechui/nvim-surround")
  use("L3MON4D3/LuaSnip")
  use("lewis6991/gitsigns.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("mechatroner/rainbow_csv")
  use("mfussenegger/nvim-dap")
  use("mg979/vim-visual-multi")
  use("michaeljsmith/vim-indent-object")
  use("moll/vim-bbye")
  use("neovim/nvim-lspconfig")
  use("nmac427/guess-indent.nvim")
  use("numToStr/Comment.nvim")
  use("nvim-lualine/lualine.nvim")
  use("phaazon/hop.nvim")
  use("tpope/vim-unimpaired")
  use("vim-scripts/ReplaceWithRegister")
  use("WhoIsSethDaniel/mason-tool-installer.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("williamboman/mason.nvim")
  use({ "nvim-neo-tree/neo-tree.nvim", branch = "main" })

  if packer_bootstrap then
    vim.cmd("autocmd User PackerComplete quitall")
    require("packer").sync()
  end
end)

-- Plugin setup for simple plugins

local setup = function(name)
  local plugin = util.safe_require(name)
  if plugin then plugin.setup({}) end
end

setup("hop")
setup("guess-indent")
setup("Comment")
setup("substitute")
setup("nvim-surround")

vim.cmd("highlight! link HopNextKey Normal")
vim.cmd("highlight! link HopNextKey1 Normal")
vim.cmd("highlight! link HopNextKey2 Normal")
