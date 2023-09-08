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
    local compare = require("cmp.config.compare")
    local types = require("cmp.types")
    local lspkind = require("lspkind")

    ---@type table<integer, integer>
    local modified_priority = {
      [types.lsp.CompletionItemKind.Variable] = types.lsp.CompletionItemKind.Method,
      [types.lsp.CompletionItemKind.Snippet] = 100, -- bottom
      [types.lsp.CompletionItemKind.Keyword] = 100, -- bottom
      [types.lsp.CompletionItemKind.Text] = 100, -- bottom
    }
    ---@param kind integer: kind of completion entry
    local function modified_kind(kind) return modified_priority[kind] or kind end

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noselect",
      },

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

      sorting = {
        comparators = {
          function(entry1, entry2) -- sort by compare kind (Variable, Function etc)
            local kind1 = modified_kind(entry1:get_kind())
            local kind2 = modified_kind(entry2:get_kind())
            if kind1 ~= kind2 then return kind1 - kind2 < 0 end
          end,
          compare.offset,
          compare.exact,
          function(entry1, entry2) -- sort by length ignoring "=~"
            local len1 = string.len(string.gsub(entry1.completion_item.label, "[=~()_]", ""))
            local len2 = string.len(string.gsub(entry2.completion_item.label, "[=~()_]", ""))
            if len1 ~= len2 then return len1 - len2 < 0 end
          end,
          ---@diagnostic disable-next-line: assign-type-mismatch
          compare.recently_used,
          compare.score,
          compare.order,
        },
      },

      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
        { name = "crates" },
        { name = "luasnip" },
      },

      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },

      window = {
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
