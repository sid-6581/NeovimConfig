return {
  "b0o/incline.nvim",
  priority = 998,

  opts = {
    highlight = {
      groups = {
        InclineNormal = {
          guifg = require("gruvbox").palette.light1,
        },
        InclineNormalNC = {
          guifg = require("gruvbox").palette.light4,
          cterm = "italic",
          gui = "italic",
        },
      },
    },

    window = {
      margin = {
        vertical = 0,
        horizontal = 0,
      },
      zindex = 1,
      options = {
        winblend = 100,
      },
    },

    ignore = {
      unlisted_buffers = false,
      buftypes = {},
    },

    hide = {
      cursorline = "focused_win",
    },

    render = function(props)
      local bufname = vim.api.nvim_buf_get_name(props.buf)

      if bufname == "" then
        return nil
      end

      local filename = vim.fn.fnamemodify(bufname, ":.")
      local icon, color = require("mini.icons").get("file", filename)

      return {
        { icon, group = color },
        { " " },
        { filename },
      }
    end,
  },

  config = function(_, opts)
    require("incline").setup(opts)

    require("snacks").toggle({
      name = "Incline",
      get = function()
        return require("incline").is_enabled()
      end,
      set = function()
        require("incline").toggle()
      end,
    }):map("<Leader>uI")
  end,
}
