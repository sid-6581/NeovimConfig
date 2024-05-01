return {
  "folke/trouble.nvim",
  event = "VeryLazy",

  opts = {
    use_diagnostic_signs = true,
  },

  -- stylua: ignore start
  keys = {
    { "<Leader>xx", function() require("trouble").toggle() end, desc = "Toggle trouble" },
    { "<Leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, desc = "Toggle workspace diagnostics", },
    { "<Leader>xd", function() require("trouble").toggle("document_diagnostics") end, desc = "Toggle document diagnostics", },
    { "<Leader>xl", function() require("trouble").toggle("loclist") end, desc = "Toggle loc list" },
    { "<Leader>xq", function() require("trouble").toggle("quickfix") end, desc = "Toggle quickfix" },
    { "<Leader>xr", function() require("trouble").toggle("lsp_references") end, desc = "Toggle references" },
  },
  -- stylua: ignore end
}
