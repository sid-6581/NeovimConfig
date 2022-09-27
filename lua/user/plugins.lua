local ensure_packer = function()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) == 0 then
    return false
  end
  vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
  return true
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local util_status_ok, packer_util = pcall(require, "packer.util")
if not util_status_ok then
  return
end

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

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("lewis6991/impatient.nvim")
  use("rcarriga/nvim-notify")
  use("nvim-telescope/telescope.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("nvim-lua/plenary.nvim")
  use("stevearc/dressing.nvim")
  use("nvim-lualine/lualine.nvim")
  use("goolord/alpha-nvim")
  use("folke/which-key.nvim")
  use("folke/trouble.nvim")
  use("s1n7ax/nvim-window-picker")
  use("MunifTanjim/nui.nvim")
  use({ "nvim-neo-tree/neo-tree.nvim", branch = "main" })
  use("akinsho/toggleterm.nvim")
  use({
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup({})
      vim.cmd("highlight! link HopNextKey Normal")
      vim.cmd("highlight! link HopNextKey1 Normal")
      vim.cmd("highlight! link HopNextKey2 Normal")
    end,
  })
  use("lukas-reineke/indent-blankline.nvim")
  use("ahmedkhalf/project.nvim")
  use("moll/vim-bbye")
  use("lewis6991/gitsigns.nvim")
  use({
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
      })
    end,
  })
  use("gpanders/editorconfig.nvim")
  use({
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({})
    end,
  })
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({})
    end,
  })
  use("mechatroner/rainbow_csv")
  use({
    "gbprod/substitute.nvim",
    config = function()
      require("substitute").setup({})
    end,
  })
  use("vim-scripts/ReplaceWithRegister")
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  })
  use("mg979/vim-visual-multi")
  use("AndrewRadev/sideways.vim")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("WhoIsSethDaniel/mason-tool-installer.nvim")
  use("neovim/nvim-lspconfig")
  use("L3MON4D3/LuaSnip")
  use("simrat39/rust-tools.nvim")
  use("mfussenegger/nvim-dap")
  use("jose-elias-alvarez/null-ls.nvim")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/nvim-cmp")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  if packer_bootstrap then
    vim.cmd("autocmd User PackerComplete quitall")
    require("packer").sync()
  end
end)
