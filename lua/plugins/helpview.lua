return {
  "OXY2DEV/helpview.nvim",

  opts = {
    vimdoc = {
      arguments = {
        default = {
          padding_left = "",
          padding_right = "",
        },
      },

      inline_codes = {
        padding_left = "",
        padding_right = "",
      },

      keycodes = {
        default = {
          padding_left = "",
          padding_right = "",
        },
      },

      notes = {
        default = {
          padding_left = "",
          padding_right = "",
        },
      },

      optionlinks = {
        default = {
          padding_left = "",
          padding_right = "",
        },
      },

      tags = {
        default = {
          padding_left = "",
          padding_right = "",
        },
      },

      taglinks = {
        default = {
          padding_left = "",
          padding_right = "",
        },
      },
    },
  },

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
