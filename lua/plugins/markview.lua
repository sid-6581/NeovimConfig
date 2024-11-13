return {
  "OXY2DEV/markview.nvim",
  event = "VeryLazy",
  ft = "markdown",

  opts = {
    modes = { "n", "i", "no", "c", "s", "S" },
    -- hybrid_modes = { "n", "i", "v", "V", "s", "S" },

    highlight_groups = "light",

    headings = {
      enable = true,
      shift_width = 0,

      heading_1 = {
        style = "icon",
        sign = "󰌕 ",
        sign_hl = "MarkviewHeading1Sign",
        icon = "▌󰼏  ",
        icon_hl = "MarkviewHeading1Sign",
        hl = "markdownH1",
      },
      heading_2 = {
        style = "icon",
        sign = "󰌖 ",
        sign_hl = "MarkviewHeading2Sign",
        icon = "▌󰎨  ",
        icon_hl = "MarkviewHeading2Sign",
        hl = "markdownH2",
      },
      heading_3 = {
        style = "icon",
        icon = "▌󰼑  ",
        icon_hl = "MarkviewHeading3Sign",
        hl = "markdownH3",
      },
      heading_4 = {
        style = "icon",
        icon = "▌󰎲  ",
        icon_hl = "MarkviewHeading4Sign",
        hl = "markdownH4",
      },
      heading_5 = {
        style = "icon",
        icon = "▌󰼓  ",
        icon_hl = "MarkviewHeading5Sign",
        hl = "markdownH5",
      },
      heading_6 = {
        style = "icon",
        icon = "▌󰎴  ",
        icon_hl = "MarkviewHeading5Sign",
        hl = "markdownH6",
      },
    },
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
