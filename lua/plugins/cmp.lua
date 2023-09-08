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

    cmp.setup({
      snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
      },

      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
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

      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
          local result = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
              buffer = "buffer",
              nvim_lsp = "lsp",
              luasnip = "luasnip",
              nvim_lua = "lua",
            },
            maxwidth = 100,
            ellipsis_char = "...",
          })(entry, vim_item)
          result.dup = 0
          return result
        end,
      },

      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
        { name = "crates" },
      },

      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    cmp.setup.cmdline("/", {
      mapping = {
        ["<C-k>"] = { c = cmp.mapping.select_prev_item() },
        ["<C-j>"] = { c = cmp.mapping.select_next_item() },
        ["<Up>"] = { c = cmp.mapping.select_prev_item() },
        ["<Down>"] = { c = cmp.mapping.select_next_item() },
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
        ["<Up>"] = { c = cmp.mapping.select_prev_item() },
        ["<Down>"] = { c = cmp.mapping.select_next_item() },
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
