return {
  "hrsh7th/nvim-cmp",
  event = { "VeryLazy", "InsertEnter" },

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "saadparwaiz1/cmp_luasnip",
  },

  opts = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.register_source("cmdline", require("util.cmp_cmdline").new())

    return {
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
        ghost_text = true,
      },
    }
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
      --- @diagnostic disable-next-line: missing-fields
      formatting = {
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
