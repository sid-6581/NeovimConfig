return {
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
  },

  {
    "echasnovski/mini.misc",
    priority = 1000,

    config = function()
      require("mini.misc").setup_auto_root(
        { ".git", "Makefile", ".obsidian" },
        function(path) return vim.fs.dirname(path) end
      )
    end,
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
          F = gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
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
        f = "Function call",
        F = "Function",
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
        --- @diagnostic disable-next-line: assign-type-mismatch
        i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
        --- @diagnostic disable-next-line: assign-type-mismatch
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

    keys = {
      { "]e", function() require("mini.bracketed").diagnostic("forward", { severity = vim.diagnostic.severity.ERROR }) end, desc = "Error forward" },
      { "[e", function() require("mini.bracketed").diagnostic("backward", { severity = vim.diagnostic.severity.ERROR }) end, desc = "Error backward" },
    },

    opts = {
      comment = { suffix = "" },
      undo = { suffix = "" },
      yank = { suffix = "" },
    },
  },

  {
    "echasnovski/mini.files",
    event = "VeryLazy",

    keys = {
      { "<leader>fm", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end, desc = "Open mini.files (file dir)" },
      { "<leader>fM", function() require("mini.files").open(vim.loop.cwd(), true) end, desc = "Open mini.files (cwd)" },
    },

    opts = {
      windows = {
        preview = false,
        width_focus = 50,
        width_preview = 50,
      },
      options = {
        use_as_default_explorer = false,
      },
    },
  },

  {
    "echasnovski/mini.hipatterns",
    event = "VeryLazy",

    opts = {
      highlighters = {
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

        scriban_block = {
          pattern = function(_buf_id)
            if vim.fn.expand("%:e") ~= "sbntxt" then
              return nil
            end

            return "{{[^}]-}}"
          end,

          group = "Comment",
        },
      },
    },
  },

  {
    "echasnovski/mini.move",
    event = "VeryLazy",

    opts = {
      mappings = {
        line_left = "",
        line_right = "",
      },
      options = {
        reindent_linewise = true,
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
        mappings = {
          toggle = "",
          join = "gJ",
          split = "gS",
        },
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
}
