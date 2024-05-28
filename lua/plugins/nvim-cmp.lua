return {
  "hrsh7th/nvim-cmp",
  event = { "VeryLazy", "InsertEnter" },

  dependencies = {
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "saadparwaiz1/cmp_luasnip",

    {
      "L3MON4D3/LuaSnip",

      dependencies = { "rafamadriz/friendly-snippets" },

      opts = function()
        -- local ext_opts = {
        --   active = {
        --     virt_text = {},
        --   },
        --   passive = {
        --     virt_text = { { "|", "GruvboxBlue" } },
        --     virt_text_pos = "inline",
        --     hl_mode = "combine",
        --   },
        -- }

        return {
          history = false,
          region_check_events = { "CursorMoved", "CursorHold", "InsertEnter" },
          delete_check_events = { "TextChanged", "InsertLeave" },
          -- ext_opts = {
          --   [require("luasnip.util.types").insertNode] = ext_opts,
          --   [require("luasnip.util.types").choiceNode] = ext_opts,
          --   [require("luasnip.util.types").exitNode] = ext_opts,
          -- },
        }
      end,

      config = function(_, opts)
        require("luasnip").setup(opts)
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
      end,
    },
  },

  opts = function()
    local cmp = require("cmp")
    local compare = require("cmp.config.compare")
    local types = require("cmp.types")
    local lspkind = require("lspkind")
    local luasnip = require("luasnip")

    return {
      completion = {
        completeopt = "menu,menuone",
      },

      snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
      },

      mapping = {
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
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
          local result = lspkind.cmp_format({
            mode = "symbol_text",
            menu = {
              buffer = "buffer  ",
              luasnip = "luasnip ",
              nvim_lsp = "lsp     ",
              nvim_lua = "lua     ",
              path = "path    ",
              crates = "crates  ",
            },
            ellipsis_char = "…",
            show_labelDetails = true,
          })(entry, vim_item)
          -- result.menu = result.menu:gsub("  ", " ")
          local maxwidth = 40
          if vim.fn.strchars(result.menu) > maxwidth then
            result.menu = vim.fn.strcharpart(result.menu, 0, maxwidth) .. "…"
          end
          return result
        end,
      },

      -- sorting = {
      --   priority_weight = 2,
      --   comparators = {
      --     function(entry1, entry2)
      --       local kind1 = entry1:get_kind() --- @type lsp.CompletionItemKind | number
      --       local kind2 = entry2:get_kind() --- @type lsp.CompletionItemKind | number
      --       if kind1 ~= kind2 then
      --         if kind1 == types.lsp.CompletionItemKind.Snippet then return false end
      --         if kind2 == types.lsp.CompletionItemKind.Snippet then return true end
      --         if kind1 == types.lsp.CompletionItemKind.Text then return false end
      --         if kind2 == types.lsp.CompletionItemKind.Text then return true end
      --         local diff = kind1 - kind2
      --         if diff < 0 then
      --           return false
      --         elseif diff > 0 then
      --           return true
      --         end
      --       end
      --       return nil
      --     end,
      --     compare.offset,
      --     compare.exact,
      --     -- compare.scopes,
      --     compare.score,
      --     compare.recently_used,
      --     compare.locality,
      --     compare.sort_text,
      --     compare.length,
      --     compare.order,
      --   },
      -- },

      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "nvim_lua" },
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
      mapping = {
        ["<Tab>"] = { c = cmp.mapping.confirm({ select = true }) },
      },
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
      }),
    })
  end,
}
