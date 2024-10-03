return {
  "OXY2DEV/helpview.nvim",
  event = "VeryLazy",

  opts = {},

  config = function(_, opts)
    require("helpview").setup(opts)

    vim.api.nvim_create_autocmd(
      { "FileType" },
      {
        pattern = { "help" },
        callback = function(event)
          require("which-key").add(
            {
              buffer = event.buf,
              { "<A-v>", function() require("helpview").commands.toggle(event.buf) end, desc = "Toggle helpview (buffer) [helpview]" },
              { "<Leader>uv", function() require("helpview").commands.toggleAll() end, desc = "Toggle helpview (global) [helpview]" },
              { "<Leader>uV", function() require("helpview").commands.toggle(event.buf) end, desc = "Toggle helpview (buffer) [helpview]" },
            }
          )
        end,
      })
  end,
}
