local ensure_packer = function()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  ---@diagnostic disable-next-line: missing-parameter
  if vim.fn.empty(vim.fn.glob(install_path)) == 0 then
    return false
  end
  vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
  return true
end

local packer_bootstrap = ensure_packer()

local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
  return
end

local util_status_ok, packer_util = pcall(require, "packer.util")
if not util_status_ok then
  return
end

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

  use("michaeljsmith/vim-indent-object")
  use("tpope/vim-unimpaired")
  use("AndrewRadev/sideways.vim")
  use("L3MON4D3/LuaSnip")
  use("WhoIsSethDaniel/mason-tool-installer.nvim")
  use("ahmedkhalf/project.nvim")
  use("akinsho/toggleterm.nvim")
  use("ellisonleao/gruvbox.nvim")
  use("folke/trouble.nvim")
  use("folke/which-key.nvim")
  use("folke/lua-dev.nvim")
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
  use("lewis6991/gitsigns.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("mechatroner/rainbow_csv")
  use("mfussenegger/nvim-dap")
  use("mg979/vim-visual-multi")
  use("moll/vim-bbye")
  use("neovim/nvim-lspconfig")
  use("nmac427/guess-indent.nvim")
  use("numToStr/Comment.nvim")
  use("nvim-lualine/lualine.nvim")
  use("phaazon/hop.nvim")
  use("simrat39/rust-tools.nvim")
  use("vim-scripts/ReplaceWithRegister")
  use("williamboman/mason-lspconfig.nvim")
  use("williamboman/mason.nvim")
  use({ "nvim-neo-tree/neo-tree.nvim", branch = "main" })

  if packer_bootstrap then
    vim.cmd("autocmd User PackerComplete quitall")
    require("packer").sync()
  end
end)

-- Plugin setup for simple plugins

local hop_status_ok, hop = pcall(require, "hop")
if hop_status_ok then
  hop.setup({})
  vim.cmd("highlight! link HopNextKey Normal")
  vim.cmd("highlight! link HopNextKey1 Normal")
  vim.cmd("highlight! link HopNextKey2 Normal")
end

local setup = function(name)
  local status_ok, plugin = pcall(require, name)
  if status_ok then
    plugin.setup({})
  end
end

setup("guess-indent")
setup("Comment")
setup("substitute")
setup("nvim-surround")
