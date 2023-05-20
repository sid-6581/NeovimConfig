---@diagnostic disable: assign-type-mismatch

return {
  "hrsh7th/nvim-cmp",
  event = "VeryLazy",

  dependencies = {
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    {
      "saadparwaiz1/cmp_luasnip",
      dependencies = {
        {
          "L3MON4D3/LuaSnip",
          config = function()
            require("luasnip").setup({})
          end,
        },
      },
    },
  },

  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      },

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          mode = "symbol_text",
          menu = {
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
          },
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },

      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
      },

      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },

      window = {
        documentation = cmp.config.window.bordered(),
      },
    })
  end,
}
