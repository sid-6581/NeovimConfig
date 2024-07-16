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
    "echasnovski/mini.icons",
    priority = 2000,
    opts = {},

    config = function(_, opts)
      require("mini.icons").setup(opts)
      MiniIcons.mock_nvim_web_devicons()
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
      {
        "]e",
        function() require("mini.bracketed").diagnostic("forward", { severity = vim.diagnostic.severity.ERROR }) end,
        desc = "Error forward [mini.bracketed]",
      },
      {
        "[e",
        function() require("mini.bracketed").diagnostic("backward", { severity = vim.diagnostic.severity.ERROR }) end,
        desc = "Error backward [mini.bracketed]",
      },
    },

    opts = {
      comment = { suffix = "" },
      quickfix = { suffix = "" },
      treesitter = { suffix = "" },
      undo = { suffix = "" },
      yank = { suffix = "" },
    },
  },

  {
    "echasnovski/mini.files",
    event = "VeryLazy",

    keys = {
      { "<leader>fm", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end, desc = "Open (file dir) [mini.files]" },
      { "<leader>fM", function() require("mini.files").open(vim.loop.cwd(), false) end, desc = "Open (cwd) [mini.files]" },
    },

    opts = {
      windows = {
        preview = true,
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
