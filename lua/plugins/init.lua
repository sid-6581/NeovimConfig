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

  {
    "IndianBoy42/tree-sitter-just",
    event = "VeryLazy",
    ft = "just",
    config = true,
    build = ":TSInstall just",
  },

  --
  -- Other plugins
  --
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
  },

  {
    "yorickpeterse/nvim-pqf",
    event = "VeryLazy",
    main = "pqf",
    config = true,
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
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
    "lambdalisue/suda.vim",
    event = "VeryLazy",
    init = function() vim.g.suda_smart_edit = 1 end,
  },

  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      vim.g.VM_show_warnings = 0
      vim.g.VM_silent_exit = 1
    end,
  },

  {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",

    keys = {
      {
        mode = { "o", "x" },
        "ii",
        "<CMD>lua require('various-textobjs').indentation(true, true)<CR>",
        desc = "indentation level (no line above)",
      },
      {
        mode = { "o", "x" },
        "ai",
        "<CMD>lua require('various-textobjs').indentation(false, true)<CR>",
        desc = "indentation level (and line above)",
      },
      {
        mode = { "o", "x" },
        "iI",
        "<CMD>lua require('various-textobjs').indentation(true, true)<CR>",
        desc = "indentation level (no lines above/below)",
      },
      {
        mode = { "o", "x" },
        "aI",
        "<CMD>lua require('various-textobjs').indentation(false, false)<CR>",
        desc = "indentation level (and lines above/below)",
      },
      { mode = { "o", "x" }, "iS", "<CMD>lua require('various-textobjs').subword(true)<CR>", desc = "inner subword" },
      { mode = { "o", "x" }, "aS", "<CMD>lua require('various-textobjs').subword(false)<CR>", desc = "a subword" },
      { mode = { "o", "x" }, "|", "<CMD>lua require('various-textobjs').column()<CR>", desc = "column down" },
      {
        mode = { "o", "x" },
        "iv",
        "<CMD>lua require('various-textobjs').value(true)<CR>",
        desc = "inner value (assignment or key/value)",
      },
      {
        mode = { "o", "x" },
        "av",
        "<CMD>lua require('various-textobjs').value(false)<CR>",
        desc = "a value (assignment or key/value)",
      },
      {
        mode = { "o", "x" },
        "ik",
        "<CMD>lua require('various-textobjs').key(true)<CR>",
        desc = "inner key (assignment or key/value)",
      },
      {
        mode = { "o", "x" },
        "ak",
        "<CMD>lua require('various-textobjs').key(false)<CR>",
        desc = "a key (assignment or key/value)",
      },
      {
        mode = { "o", "x" },
        "im",
        "<CMD>lua require('various-textobjs').chainMember(true)<CR>",
        desc = "inner chain member",
      },
      {
        mode = { "o", "x" },
        "am",
        "<CMD>lua require('various-textobjs').chainMember(false)<CR>",
        desc = "a chain member",
      },
      {
        mode = { "o", "x" },
        "iL",
        "<CMD>lua require('various-textobjs').lineCharacterwise(true)<CR>",
        desc = "inner line characterwise",
      },
      {
        mode = { "o", "x" },
        "aL",
        "<CMD>lua require('various-textobjs').lineCharacterwise(false)<CR>",
        desc = "a line characterwise",
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
      { "gN", function() require("flash").treesitter({ jump = { pos = "end" } }) end, desc = "Flash Treesitter" },
      { mode = { "o", "x" }, "n", function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      {
        mode = { "o", "x" },
        "N",
        function() require("flash").treesitter_search() end,
        desc = "Flash Treesitter Search",
      },
      { mode = { "o", "x" }, "R", function() require("flash").remote() end, desc = "Remote Flash" },
    },

    opts = {
      label = {
        style = "inline",
      },
      modes = {
        char = {
          config = function(opts)
            -- autohide flash when in operator-pending mode
            opts.autohide = vim.fn.mode(true):find("no") and (vim.v.operator == "y" or vim.v.operator == "d")
            -- disable jump labels when enabled and when using a count
            opts.jump_labels = opts.jump_labels and vim.v.count == 0
          end,
        },
        search = {
          label = {
            before = true,
            after = false,
          },
          highlight = {
            backdrop = true,
          },
        },
        treesitter = {
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
    "folke/trouble.nvim",
    event = "VeryLazy",

    opts = {
      use_diagnostic_signs = true,
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",

    keys = {
      { "[c", function() require("gitsigns").prev_hunk() end, desc = "Previous change (git)" },
      { "]c", function() require("gitsigns").next_hunk() end, desc = "Next change (git)" },
      { "<Leader>gd", function() require("gitsigns").diff_this("HEAD") end, desc = "Diff" },
      { "<Leader>gj", function() require("gitsigns").next_hunk() end, desc = "Next hunk" },
      { "<Leader>gk", function() require("gitsigns").prev_hunk() end, desc = "Prev hunk" },
      { "<Leader>gl", function() require("gitsigns").blame_line() end, desc = "Blame" },
      { "<Leader>gp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
      { "<Leader>gR", function() require("gitsigns").reset_buffer() end, desc = "Reset buffer" },
      { "<Leader>gr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
      { "<Leader>gs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
      { "<Leader>gu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo stage hunk" },
    },

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
