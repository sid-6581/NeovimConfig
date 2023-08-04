return {
  "folke/lazy.nvim",

  --
  -- Libraries used by other plugins
  --
  {
    "MunifTanjim/nui.nvim",
    event = "VeryLazy",
  },

  {
    "nvim-lua/plenary.nvim",
    event = "VeryLazy",
  },

  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },

  --
  -- File types
  --
  {
    "isobit/vim-caddyfile",
    ft = "caddyfile",
  },

  {
    "mechatroner/rainbow_csv",
    ft = "csv",
  },

  {
    "vmware-archive/salt-vim",
    ft = "sls",
  },

  --
  -- Other plugins
  --
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "tpope/vim-unimpaired",
    event = "VeryLazy",
  },

  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },

  {
    "nmac427/guess-indent.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function() require("colorizer").setup() end,
  },

  {
    "tiagovla/scope.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    main = "project_nvim",

    opts = {
      detection_methods = { "pattern", "lsp" },
      ignore_lsp = { "null-ls" },
      patterns = { ".git" },
      scope_chdir = "tab",
      show_hidden = true,
      silent_chdir = true,
    },
  },

  {
    "lambdalisue/suda.vim",
    event = "VeryLazy",
    init = function() vim.g.suda_smart_edit = 1 end,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  {
    "vim-scripts/ReplaceWithRegister",
    event = "VeryLazy",
  },

  {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",

    keys = {
      {
        mode = { "o", "x" },
        "ii",
        "<cmd>lua require('various-textobjs').indentation(true, true)<CR>",
        desc = "indentation level (no line above)",
      },
      {
        mode = { "o", "x" },
        "ai",
        "<cmd>lua require('various-textobjs').indentation(false, true)<CR>",
        desc = "indentation level (and line above)",
      },
      {
        mode = { "o", "x" },
        "iI",
        "<cmd>lua require('various-textobjs').indentation(true, true)<CR>",
        desc = "indentation level (no lines above/below)",
      },
      {
        mode = { "o", "x" },
        "aI",
        "<cmd>lua require('various-textobjs').indentation(false, false)<CR>",
        desc = "indentation level (and lines above/below)",
      },
      { mode = { "o", "x" }, "is", "<cmd>lua require('various-textobjs').subword(true)<CR>", desc = "inner subword" },
      { mode = { "o", "x" }, "as", "<cmd>lua require('various-textobjs').subword(false)<CR>", desc = "a subword" },
      { mode = { "o", "x" }, "|", "<cmd>lua require('various-textobjs').column()<CR>", desc = "column down" },
      {
        mode = { "o", "x" },
        "iv",
        "<cmd>lua require('various-textobjs').value(true)<CR>",
        desc = "inner value (assignment or key/value)",
      },
      {
        mode = { "o", "x" },
        "av",
        "<cmd>lua require('various-textobjs').value(false)<CR>",
        desc = "a value (assignment or key/value)",
      },
      {
        mode = { "o", "x" },
        "ik",
        "<cmd>lua require('various-textobjs').key(true)<CR>",
        desc = "inner key (assignment or key/value)",
      },
      {
        mode = { "o", "x" },
        "ak",
        "<cmd>lua require('various-textobjs').key(false)<CR>",
        desc = "a key (assignment or key/value)",
      },
      {
        mode = { "o", "x" },
        "im",
        "<cmd>lua require('various-textobjs').chainMember(true)<CR>",
        desc = "inner chain member",
      },
      {
        mode = { "o", "x" },
        "am",
        "<cmd>lua require('various-textobjs').chainMember(false)<CR>",
        desc = "a chain member",
      },
    },

    opts = {
      lookForwardSmall = 0,
      lookForwardBig = 0,
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",

    keys = {
      { "gn", function() require("flash").treesitter({ jump = { pos = "start" } }) end, desc = "Flash Treesitter" },
      { mode = { "o", "x" }, "n", function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { mode = { "o", "x" }, "r", function() require("flash").remote() end, desc = "Remote Flash" },
    },

    opts = {
      label = {
        style = "inline",
      },
      modes = {
        search = {
          label = {
            before = true,
            after = false,
          },
          highlight = {
            backdrop = true,
          },
        },
      },
    },

    init = function()
      local colors = require("gruvbox.palette").colors
      vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#ffffff", fg = "#000000", italic = true, reverse = true })
      vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = colors.gray })
    end,
  },

  {
    "rmagatti/goto-preview",
    event = "VeryLazy",

    keys = {
      { "gpd", function() require("goto-preview").goto_preview_definition({}) end, desc = "Preview definition" },
      {
        "gpt",
        function() require("goto-preview").goto_preview_type_definition({}) end,
        desc = "Preview type definition",
      },
      {
        "gpi",
        function() require("goto-preview").goto_preview_implementation({}) end,
        desc = "Preview implementation",
      },
      { "gpP", function() require("goto-preview").close_all_win({}) end, desc = "Close all preview windows" },
      { "gpr", function() require("goto-preview").goto_preview_references({}) end, desc = "Preview references" },
    },

    opts = {},
  },

  {
    "gbprod/substitute.nvim",
    event = "VeryLazy",

    keys = {
      { "cx", function() require("substitute.exchange").operator() end, desc = "Exchange" },
      { "cxx", function() require("substitute.exchange").line() end, desc = "Exchange line" },
      { mode = "n", "cxc", function() require("substitute.exchange").cancel() end, desc = "Cancel exchange" },
      { mode = "x", "X", function() require("substitute.exchange").visual() end, desc = "Visual exchange" },
    },

    opts = {},
  },

  {
    "Wansmer/treesj",
    event = "VeryLazy",

    keys = {
      { "<Leader>cs", "<CMD>TSJSplit<CR>", desc = "Split node" },
      { "<Leader>cj", "<CMD>TSJJoin<CR>", desc = "Join node" },
    },

    opts = {
      use_default_keymaps = false,
      check_syntax_error = false,
    },
  },

  {
    "fedepujol/move.nvim",
    event = "VeryLazy",

    keys = {
      { "<A-j>", ":MoveLine(1)<CR>", desc = "Move line down" },
      { "<A-k>", ":MoveLine(-1)<CR>", desc = "Move line up" },
      { "<S-A-l>", ":MoveWord(1)<CR>", desc = "Move word right" },
      { "<S-A-h>", ":MoveWord(-1)<CR>", desc = "Move word left" },
      { mode = "v", "<A-j>", ":MoveBlock(1)<CR>", desc = "Move block up" },
      { mode = "v", "<A-k>", ":MoveBlock(-1)<CR>", desc = "Move block down" },
      { mode = "v", "<A-h>", ":MoveHBlock(-1)<CR>", desc = "Move block left" },
      { mode = "v", "<A-l>", ":MoveHBlock(1)<CR>", desc = "Move block right" },
    },
  },

  {
    "AndrewRadev/sideways.vim",
    event = "VeryLazy",

    keys = {
      { "<A-h>", "<CMD>SidewaysLeft<CR>", desc = "Move argument left" },
      { "<A-l>", "<CMD>SidewaysRight<CR>", desc = "Move argument right" },
      { mode = "o", "aa", "<Plug>SidewaysArgumentTextobjA", desc = "an argument" },
      { mode = "o", "ia", "<Plug>SidewaysArgumentTextobjI", desc = "inner argument" },
      { mode = "x", "aa", "<Plug>SidewaysArgumentTextobjA", desc = "an argument" },
      { mode = "x", "ia", "<Plug>SidewaysArgumentTextobjI", desc = "inner argument" },
    },
  },

  {
    "kazhala/close-buffers.nvim",
    event = "VeryLazy",

    keys = {
      { "<S-Esc>", function() require("close_buffers").delete({ type = "this" }) end, desc = "Delete buffer" },
      { "<Leader>bd", function() require("close_buffers").delete({ type = "this" }) end, desc = "Delete buffer" },
      { "<Leader>ba", function() require("close_buffers").delete({ type = "all" }) end, desc = "Delete all buffers" },
      {
        "<Leader>bh",
        function() require("close_buffers").delete({ type = "hidden" }) end,
        desc = "Delete hidden buffers",
      },
      {
        "<Leader>bo",
        function() require("close_buffers").delete({ type = "other" }) end,
        desc = "Delete other buffers",
      },
    },

    opts = {
      filetype_ignore = { "neo-tree" },
      preserve_window_layout = { "this" },
    },
  },

  {
    "wellle/targets.vim",
    event = "VeryLazy",
    init = function()
      vim.g.targets_seekRanges = "cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA"
    end,
  },

  {
    "folke/trouble.nvim",
    event = "VeryLazy",

    opts = {
      use_diagnostic_signs = true,
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",

    opts = {
      preview_config = {
        border = "single",
      },
    },
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",

    opts = {
      input = {
        border = "single",
        get_config = function(opts)
          return {
            insert_only = #(opts.default or "") == 0,
            start_in_insert = #(opts.default or "") == 0,
          }
        end,
      },
      select = {
        nui = {
          border = {
            style = "single",
          },
        },
        builtin = {
          border = "single",
        },
      },
    },
  },

  {
    "s1n7ax/nvim-window-picker",
    event = "VeryLazy",

    config = function()
      local colors = require("gruvbox.palette").colors

      require("window-picker").setup({
        highlights = {
          statusline = {
            focused = {
              fg = colors.bright_yellow,
              bg = colors.dark1,
              bold = true,
            },
            unfocused = {
              fg = colors.bright_yellow,
              bg = colors.dark1,
              bold = true,
            },
          },
          winbar = {
            focused = {
              fg = colors.bright_yellow,
              bg = colors.dark1,
              bold = true,
            },
            unfocused = {
              fg = colors.bright_yellow,
              bg = colors.dark1,
              bold = true,
            },
          },
        },
        picker_config = {
          statusline_winbar_picker = {
            selection_display = function(char) return "  " .. char .. "  " end,
          },
        },
      })
    end,
  },
}
