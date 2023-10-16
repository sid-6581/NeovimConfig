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
}
