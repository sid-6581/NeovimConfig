return {
  "L3MON4D3/LuaSnip",
  event = "VeryLazy",
  submodules = false,

  keys = {
    {
      "<A-u>",
      function()
        if require("luasnip").in_snippet() then
          local snip = require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()].parent.snippet
          local from, to = snip:get_buf_position()
          vim.api.nvim_buf_set_text(0, from[1], from[2], to[1], to[2], {})
          vim.fn.setpos(".", { 0, from[1] + 1, from[2] + 1 })
          require("luasnip").unlink_current()
        else
          vim.cmd.normal("u")
        end
      end,
      mode = { "i" },
      desc = "Undo snippet expansion [luasnip]",
    },
  },

  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  opts = {
    enable_autosnippets = true,
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
