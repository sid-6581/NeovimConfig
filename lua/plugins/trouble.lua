return {
  "folke/trouble.nvim",
  event = "VeryLazy",

  dependencies = {
    "nvim-telescope/telescope.nvim",

    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-q>"] = {
              function(prompt_bufnr) require("trouble.sources.telescope").open(prompt_bufnr) end,
              type = "action",
              opts = { desc = "Open in quickfix [trouble]" },
            },
          },
          n = {
            ["<C-q>"] = {
              function(prompt_bufnr) require("trouble.sources.telescope").open(prompt_bufnr) end,
              type = "action",
              opts = { desc = "Open in quickfix [trouble]" },
            },
          },
        },
      },
    },
  },

  keys = {
    { "<leader>xx", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics [trouble]" },
    { "<leader>xX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics [trouble]" },
    { "<leader>xs", "<CMD>Trouble symbols toggle focus=false<CR>", desc = "Symbols [trouble]" },
    { "<leader>xl", "<CMD>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP definitions / references / ... [trouble]" },
    { "<leader>xL", "<CMD>Trouble loclist toggle<CR>", desc = "Location list [trouble]" },
    { "<leader>xQ", "<CMD>Trouble qflist toggle<CR>", desc = "Quickfix list [trouble]" },

    --- @diagnostic disable: missing-parameter,missing-fields
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ jump = true })
        else
          require("mini.bracketed").quickfix("forward")
        end
      end,
      desc = "Next item [trouble]",
    },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").prev({ jump = true })
        else
          require("mini.bracketed").quickfix("backward")
        end
      end,
      desc = "Previous item [trouble]",
    },
    {
      "]Q",
      function()
        if require("trouble").is_open() then
          require("trouble").last({ jump = true })
        else
          require("mini.bracketed").quickfix("last")
        end
      end,
      desc = "Last item [trouble]",
    },
    {
      "[Q",
      function()
        if require("trouble").is_open() then
          require("trouble").first({ jump = true })
        else
          require("mini.bracketed").quickfix("first")
        end
      end,
      desc = "First item [trouble]",
    },
  },

  opts = {
    use_diagnostic_signs = true,
    -- warn_no_results = false,
    -- open_no_results = true,
    win = {
      size = 0.2,
    },
  },
  --- @diagnostic enable: missing-parameter,missing-fields
}
