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

    {
      "saadparwaiz1/cmp_luasnip",
      dependencies = {
        { "L3MON4D3/LuaSnip", opts = {} },
      },
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

      config = function(_, opts)
        require("null-ls")
        require("crates").setup(opts)
      end,
    },
  },

  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

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
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      },

      confirmation = {
        default_behavior = cmp.ConfirmBehavior.Replace,
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
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
        { name = "crates" },
      }),

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      experimental = {
        ghost_text = true,
      },
    })

    cmp.setup.cmdline("/", {
      mapping = {
        ["<C-k>"] = { c = cmp.mapping.select_prev_item(select_opts) },
        ["<C-j>"] = { c = cmp.mapping.select_next_item(select_opts) },
        ["<Up>"] = { c = cmp.mapping.select_prev_item(select_opts) },
        ["<Down>"] = { c = cmp.mapping.select_next_item(select_opts) },
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
        ["<C-k>"] = { c = cmp.mapping.select_prev_item(select_opts) },
        ["<C-j>"] = { c = cmp.mapping.select_next_item(select_opts) },
        ["<Up>"] = { c = cmp.mapping.select_prev_item(select_opts) },
        ["<Down>"] = { c = cmp.mapping.select_next_item(select_opts) },
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
