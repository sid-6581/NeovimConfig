return {
  "L3MON4D3/LuaSnip",
  event = "VeryLazy",
  submodules = false,

  dependencies = { "rafamadriz/friendly-snippets" },

  opts = {
    history = false,
    region_check_events = { "CursorMoved", "CursorHold", "InsertEnter" },
    delete_check_events = { "TextChanged", "InsertLeave" },
  },

  config = function(_, opts)
    require("luasnip").setup(opts)
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
  end,
}
