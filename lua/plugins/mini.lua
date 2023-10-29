return {
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
  },

  {
    "echasnovski/mini.misc",
    event = "VeryLazy",

    config = function() require("mini.misc").setup_auto_root() end,
  },

  {
    "echasnovski/mini.ai",
    event = "VeryLazy",

    opts = function()
      local gen_spec = require("mini.ai").gen_spec

      return {
        custom_textobjects = {
          a = gen_spec.argument({
            brackets = { "%b()", "%b[]", "%b{}", "%b<>", "%||" },
            separator = "%s*[,;]%s*",
          }),
          c = gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
          f = gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          o = gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        },
        n_lines = 500,
        search_method = "cover",
      }
    end,

    config = function(_, opts)
      require("mini.ai").setup(opts)

      -- Register mini.ai keys in which-key
      local i = {
        [" "] = "Whitespace",
        ['"'] = 'Balanced "',
        ["'"] = "Balanced '",
        ["`"] = "Balanced `",
        ["("] = "Balanced (",
        [")"] = "Balanced ) including white-space",
        [">"] = "Balanced > including white-space",
        ["<lt>"] = "Balanced <",
        ["]"] = "Balanced ] including white-space",
        ["["] = "Balanced [",
        ["}"] = "Balanced } including white-space",
        ["{"] = "Balanced {",
        ["?"] = "User Prompt",
        _ = "Underscore",
        a = "Argument",
        b = "Balanced ), ], }",
        c = "Class",
        f = "Function",
        o = "Block, conditional, loop",
        q = "Quote `, \", '",
        t = "Tag",
      }
      local a = vim.deepcopy(i)
      for k, v in pairs(a) do
        a[k] = v:gsub(" including.*", "")
      end

      local ic = vim.deepcopy(i)
      local ac = vim.deepcopy(a)
      for key, name in pairs({ n = "Next", l = "Last" }) do
        ---@diagnostic disable-next-line: assign-type-mismatch
        i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
        ---@diagnostic disable-next-line: assign-type-mismatch
        a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
      end
      require("which-key").register({
        mode = { "o", "x" },
        i = i,
        a = a,
      })
    end,
  },

  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    opts = {},
  },

  {
    "echasnovski/mini.bracketed",
    event = "VeryLazy",

    opts = {
      comment = { suffix = "" },
      file = { suffix = "" },
      treesitter = { suffix = "n" },
      undo = { suffix = "" },
      yank = { suffix = "" },
    },
  },

  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {},
  },

  {
    "echasnovski/mini.move",
    event = "VeryLazy",

    opts = {
      mappings = {
        line_left = "<S-Tab>",
        line_right = "<Tab>",
      },
      options = {
        reindent_linewise = false,
      },
    },
  },

  {
    "echasnovski/mini.operators",
    event = "VeryLazy",
    opts = {},
  },

  {
    "echasnovski/mini.splitjoin",
    event = "VeryLazy",

    opts = function()
      local gen_hook = require("mini.splitjoin").gen_hook
      local brackets = { brackets = { "%b{}" } }
      return {
        detect = {
          separator = "[,;]",
        },
        split = {
          hooks_post = {
            gen_hook.add_trailing_separator(brackets),
          },
        },
        join = {
          hooks_post = {
            gen_hook.del_trailing_separator(brackets),
            gen_hook.pad_brackets(brackets),
          },
        },
      }
    end,
  },

  {
    "echasnovski/mini.surround",
    event = "VeryLazy",

    keys = {
      { "<Leader>'", "<Leader>srq'", desc = "Replace surround with ''", remap = true },
      { "<Leader>(", "<Leader>sd)", desc = "Remove surrounding ()", remap = true },
      { "<Leader>)", "<Leader>srb)", desc = "Replace surround with ()", remap = true },
      { "<Leader><", "<Leader>sd>", desc = "Remove surrounding <>", remap = true },
      { "<Leader>>", "<Leader>srb>", desc = "Replace surround with <>", remap = true },
      { "<Leader>[", "<Leader>sd]", desc = "Remove surrounding []", remap = true },
      { "<Leader>]", "<Leader>srb]", desc = "Replace surround with []", remap = true },
      { "<Leader>{", "<Leader>sd{", desc = "Remove surrounding {}", remap = true },
      { "<Leader>}", "<Leader>srb{", desc = "Replace surround with { }", remap = true },
      { '<Leader>"', '<Leader>srq"', desc = 'Replace surround with ""', remap = true },
      { mode = { "v" }, "<Leader>'", "<Leader>sa'", desc = "Surround with ''", remap = true },
      { mode = { "v" }, "<Leader>)", "<Leader>sa)", desc = "Surround with ()", remap = true },
      { mode = { "v" }, "<Leader>>", "<Leader>sa>", desc = "Surround with <>", remap = true },
      { mode = { "v" }, "<Leader>]", "<Leader>sa]", desc = "Surround with []", remap = true },
      { mode = { "v" }, "<Leader>}", "<Leader>sa{", desc = "Surround with { }", remap = true },
      { mode = { "v" }, '<Leader>"', '<Leader>sa"', desc = 'Surround with ""', remap = true },
    },

    opts = {
      mappings = {
        add = "<Leader>sa",
        delete = "<Leader>sd",
        find = "<Leader>sf",
        find_left = "<Leader>sF",
        highlight = "<Leader>sh",
        replace = "<Leader>sr",
        update_n_lines = "<Leader>sn",
        suffix_last = "l",
        suffix_next = "n",
      },
      respect_selection_type = true,
    },
  },
}
