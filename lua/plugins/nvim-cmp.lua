---@diagnostic disable: missing-fields
return {
  "hrsh7th/nvim-cmp",
  event = { "VeryLazy", "InsertEnter" },

  dependencies = {
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "saadparwaiz1/cmp_luasnip",

    {
      "L3MON4D3/LuaSnip",

      dependencies = { "rafamadriz/friendly-snippets" },

      opts = {
        history = true,
      },

      config = function(_, opts)
        require("luasnip").setup(opts)
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
      end,
    },

    {
      "Saecki/crates.nvim",

      opts = {
        popup = {
          border = "single",
        },
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      },
    },
  },

  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local luasnip = require("luasnip")

    local select_opts = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
      },

      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(select_opts),
        ["<C-j>"] = cmp.mapping.select_next_item(select_opts),
        ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
        ["<Down>"] = cmp.mapping.select_next_item(select_opts),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ cmp.ConfirmBehavior.Insert, select = true })
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if not cmp.visible() and luasnip.jumpable(-1) then
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
          local result = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
              buffer = "buffer",
              luasnip = "luasnip",
              nvim_lsp = "lsp",
              nvim_lua = "lua",
              path = "path",
              crates = "crates",
            },
            maxwidth = 100,
            ellipsis_char = "...",
          })(entry, vim_item)
          result.dup = 0
          return result
        end,
      },

      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
        { name = "crates" },
      }),

      window = {
        completion = cmp.config.window.bordered({ border = "single", winhighlight = "" }),
        documentation = cmp.config.window.bordered({ border = "single", winhighlight = "" }),
      },

      experimental = {
        ghost_text = true,
      },
    })

    cmp.setup.cmdline("/", {
      mapping = {
        ["<C-k>"] = { c = cmp.mapping.select_prev_item() },
        ["<C-j>"] = { c = cmp.mapping.select_next_item() },
        ["<C-y>"] = { c = cmp.config.disable },
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<Tab>"] = { c = cmp.mapping.confirm({ select = true }) },
      },
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = {
        ["<C-k>"] = { c = cmp.mapping.select_prev_item() },
        ["<C-j>"] = { c = cmp.mapping.select_next_item() },
        ["<C-y>"] = { c = cmp.config.disable },
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<Tab>"] = { c = cmp.mapping.confirm({ select = true }) },
      },
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
