return {
  "hrsh7th/nvim-cmp",
  commit = "7e348da",
  event = { "VeryLazy", "InsertEnter" },

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "saadparwaiz1/cmp_luasnip",

    {
      "zjp-CN/nvim-cmp-lsp-rs",
      opts = {
        -- Filter out import items starting with one of these prefixes.
        -- A prefix can be crate name, module name or anything an import
        -- path starts with, no matter it's complete or incomplete.
        -- Only literals are recognized: no regex matching.
        unwanted_prefix = { "color", "ratatui::style::Styled" },
        -- make these kinds prior to others
        -- e.g. make Module kind first, and then Function second,
        --      the rest ordering is merged from a default kind list
        kind = function(k)
          -- The argument in callback is type-aware with opts annotated,
          -- so you can type the CompletionKind easily.
          return { k.Module, k.Function }
        end,
        -- Override the default comparator list provided by this plugin.
        -- Mainly used with key binding to switch between these Comparators.
        combo = {
          -- The key is the name for combination of comparators and used
          -- in notification in swiching.
          -- The value is a list of comparators functions or a function
          -- to generate the list.
          alphabetic_label_but_underscore_last = function()
            local comparators = require("cmp_lsp_rs").comparators
            return { comparators.sort_by_label_but_underscore_last }
          end,
          recentlyUsed_sortText = function()
            local compare = require("cmp").config.compare
            local comparators = require("cmp_lsp_rs").comparators
            -- Mix cmp sorting function with cmp_lsp_rs.
            return {
              compare.recently_used,
              compare.sort_text,
              comparators.sort_by_label_but_underscore_last,
            }
          end,
        },
      },
    },
  },

  opts = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local cmp_lsp_rs = require("cmp_lsp_rs")
    local comparators = cmp_lsp_rs.comparators
    local compare = require("cmp").config.compare

    cmp.register_source("cmdline", require("util.cmp_cmdline").new())

    opts = {
      completion = {
        completeopt = "menu,menuone",
      },

      snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
      },

      mapping = {
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-c>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if not cmp.visible() and luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },

      confirmation = {
        default_behavior = cmp.ConfirmBehavior.Insert,
      },

      formatting = {
        fields = { "abbr", "kind", "menu" },

        format = function(entry, vim_item)
          local result = require("lspkind").cmp_format({
            mode = "symbol_text",
            menu = {
              buffer = "buffer  ",
              luasnip = "luasnip ",
              nvim_lsp = "lsp     ",
              path = "path    ",
              crates = "crates  ",
              ["vim-dadbod-completion"] = "db      ",
            },
            ellipsis_char = "…",
            show_labelDetails = true,
          })(entry, vim_item)
          local maxwidth = 40
          if vim.fn.strchars(result.menu) > maxwidth then
            result.menu = vim.fn.strcharpart(result.menu, 0, maxwidth) .. "…"
          end

          return result
        end,
      },

      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),

      window = {
        completion = cmp.config.window.bordered({ border = "single", winhighlight = "" }),
        documentation = cmp.config.window.bordered({ border = "single", winhighlight = "" }),
      },

      experimental = {
        ghost_text = false,
      },

      sorting = {
        comparators = {
          compare.exact,
          compare.score,
          -- comparators.inherent_import_inscope,
          comparators.inscope_inherent_import,
          comparators.sort_by_label_but_underscore_last,
        },
      },
    }

    for _, source in ipairs(opts.sources) do
      cmp_lsp_rs.filter_out.entry_filter(source)
    end

    return opts
  end,

  config = function(_, opts)
    local cmp = require("cmp")

    cmp.setup(opts)

    cmp.setup.cmdline("/", {
      mapping = {
        ["<Tab>"] = { c = cmp.mapping.confirm({ select = true }) },
      },
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      formatting = {
        expandable_indicator = true,
        fields = { "abbr", "menu" },
        format = function(entry, vim_item)
          return require("lspkind").cmp_format({
            mode = "symbol_text",
            menu = { cmdline = "" },
            show_labelDetails = true,
          })(entry, vim_item)
        end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { "c" }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { "c" }),
        ["<Tab>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "c" }),
      },
      sources = cmp.config.sources({
        { name = "cmdline" },
      }),
    })
  end,
}
