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
}
