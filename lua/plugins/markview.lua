return {
  "OXY2DEV/markview.nvim",

  opts = {
    experimental = {
      check_rtp = false,
      check_rtp_message = false,
    },
    -- modes = { "n", "i", "no", "c", "s", "S" },
    -- hybrid_modes = { "n", "i", "v", "V", "s", "S" },
  },

  config = function(_, opts)
    require("markview").setup(opts)

    vim.api.nvim_create_autocmd(
      { "FileType" },
      {
        pattern = { "markdown" },
        callback = function(event)
          require("which-key").add(
            {
              buffer = event.buf,
              { "<A-\\>", function() require("markview").commands.splitToggle() end, desc = "Toggle markview split [markview]" },
              { "<A-v>", function() require("markview").commands.toggle() end, desc = "Toggle markview (buffer) [markview]" },
              { "<Leader>uv", function() require("markview").commands.toggleAll() end, desc = "Toggle markview (global) [markview]" },
              { "<Leader>uV", function() require("markview").commands.toggle() end, desc = "Toggle markview (buffer) [markview]" },
            }
          )
        end,
      })
  end,
}
