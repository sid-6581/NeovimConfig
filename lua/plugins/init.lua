return {
  "folke/lazy.nvim",

  {
    "nmac427/guess-indent.nvim",
    opts = {},
  },

  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
  },

  {
    "yorickpeterse/nvim-pqf",
    event = "VeryLazy",
    main = "pqf",
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
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",

    opts = {
      debounce = 100,
      indent = {
        char = "▏",
      },
      scope = {
        show_start = false,
        show_end = false,
      },
    },
  },

  {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",

    keys = {
      {
        mode = { "o", "x" },
        "ii",
        function() require("various-textobjs").indentation("inner", "inner") end,
        desc = "indentation level (no line above)",
      },
      {
        mode = { "o", "x" },
        "ai",
        function() require("various-textobjs").indentation("outer", "inner") end,
        desc = "indentation level (and line above)",
      },
      {
        mode = { "o", "x" },
        "iI",
        function() require("various-textobjs").indentation("inner", "inner") end,
        desc = "indentation level (no lines above/below)",
      },
      {
        mode = { "o", "x" },
        "aI",
        function() require("various-textobjs").indentation("outer", "outer") end,
        desc = "indentation level (and lines above/below)",
      },
      {
        mode = { "o", "x" },
        "iS",
        function() require("various-textobjs").subword("inner") end,
        desc = "inner subword",
      },
      { mode = { "o", "x" }, "aS", function() require("various-textobjs").subword("outer") end, desc = "a subword" },
      { mode = { "o", "x" }, "|", function() require("various-textobjs").column() end, desc = "column down" },
      {
        mode = { "o", "x" },
        "iv",
        function() require("various-textobjs").value("inner") end,
        desc = "inner value (assignment or key/value)",
      },
      {
        mode = { "o", "x" },
        "av",
        function() require("various-textobjs").value("outer") end,
        desc = "a value (assignment or key/value)",
      },
      {
        mode = { "o", "x" },
        "ik",
        function() require("various-textobjs").key("inner") end,
        desc = "inner key (assignment or key/value)",
      },
      {
        mode = { "o", "x" },
        "ak",
        function() require("various-textobjs").key("outer") end,
        desc = "a key (assignment or key/value)",
      },
      {
        mode = { "o", "x" },
        "im",
        function() require("various-textobjs").chainMember("inner") end,
        desc = "inner chain member",
      },
      {
        mode = { "o", "x" },
        "am",
        function() require("various-textobjs").chainMember("outer") end,
        desc = "a chain member",
      },
      {
        mode = { "o", "x" },
        "iL",
        function() require("various-textobjs").lineCharacterwise("inner") end,
        desc = "inner line characterwise",
      },
      {
        mode = { "o", "x" },
        "aL",
        function() require("various-textobjs").lineCharacterwise("outer") end,
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
            ---@diagnostic disable-next-line: undefined-field
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

    config = function(_, opts)
      require("flash").setup(opts)
      local colors = require("util.colors")
      vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ffffff" })
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

    keys = {
      { "<Leader>xx", function() require("trouble").toggle() end, desc = "Toggle trouble" },
      {
        "<Leader>xw",
        function() require("trouble").toggle("workspace_diagnostics") end,
        desc = "Toggle workspace diagnostics",
      },
      {
        "<Leader>xd",
        function() require("trouble").toggle("document_diagnostics") end,
        desc = "Toggle document diagnostics",
      },
      { "<Leader>xl", function() require("trouble").toggle("loclist") end, desc = "Toggle loc list" },
      { "<Leader>xq", function() require("trouble").toggle("quickfix") end, desc = "Toggle quickfix" },
      { "<Leader>xr", function() require("trouble").toggle("lsp_references") end, desc = "Toggle references" },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",

    keys = {
      { "[c", function() require("gitsigns").prev_hunk() end, desc = "Previous change (git)" },
      { "]c", function() require("gitsigns").next_hunk() end, desc = "Next change (git)" },
      { "<Leader>gd", function() require("gitsigns").diffthis() end, desc = "Diff" },
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
    "gbprod/yanky.nvim",
    event = "VeryLazy",

    keys = {
      {
        "<leader>fy",
        function() require("telescope").extensions.yank_history.yank_history({}) end,
        desc = "Yank History",
      },
      { mode = { "n", "x" }, "y", "<Plug>(YankyYank)", desc = "Yank text" },
      { mode = { "n", "x" }, "p", "<Plug>(YankyPutAfter)", desc = "Put yanked text after cursor" },
      { mode = { "n", "x" }, "P", "<Plug>(YankyPutBefore)", desc = "Put yanked text before cursor" },
      { mode = { "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", desc = "Put yanked text after selection" },
      { mode = { "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", desc = "Put yanked text before selection" },
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    },

    config = function()
      local utils = require("yanky.utils")
      local mapping = require("yanky.telescope.mapping")

      require("yanky").setup({
        highlight = {
          timer = 200,
        },
        picker = {
          telescope = {
            use_default_mappings = false,
            mappings = {
              default = mapping.put("p"),
              i = {
                ["<C-X>"] = mapping.delete(),
              },
              n = {
                p = mapping.put("p"),
                P = mapping.put("P"),
                d = mapping.delete(),
                r = mapping.set_register(utils.get_default_register()),
              },
            },
          },
        },
      })
      vim.api.nvim_set_hl(0, "YankyPut", { link = "Visual" })
      vim.api.nvim_set_hl(0, "YankyYanked", { link = "Visual" })
    end,
  },

  {
    "monaqa/dial.nvim",
    event = "VeryLazy",

    keys = {
      { "<C-A>", function() require("dial.map").manipulate("increment", "normal") end },
      { "<C-X>", function() require("dial.map").manipulate("decrement", "normal") end },
      { "g<C-A>", function() require("dial.map").manipulate("increment", "gnormal") end },
      { "g<C-X>", function() require("dial.map").manipulate("decrement", "gnormal") end },
      { mode = { "v" }, "<C-A>", function() require("dial.map").manipulate("increment", "visual") end },
      { mode = { "v" }, "<C-X>", function() require("dial.map").manipulate("decrement", "visual") end },
      { mode = { "v" }, "g<C-A>", function() require("dial.map").manipulate("increment", "gvisual") end },
      { mode = { "v" }, "g<C-X>", function() require("dial.map").manipulate("decrement", "gvisual") end },
    },
  },
}
