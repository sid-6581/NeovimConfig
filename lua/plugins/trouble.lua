return {
  "folke/trouble.nvim",
  event = "VeryLazy",

  keys = {
    { "<A-x>", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics [trouble]" },
    { "<A-o>", "<CMD>Trouble symbols toggle focus=false groups={}<CR>", desc = "Symbols [trouble]" },
    { "<Leader>xx", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics [trouble]" },
    { "<Leader>xX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics [trouble]" },
    { "<Leader>xs", "<CMD>Trouble symbols toggle focus=false groups={}<CR>", desc = "Symbols [trouble]" },
    { "<Leader>xl", "<CMD>Trouble lsp toggle focus=false<CR>", desc = "LSP definitions / references / ... [trouble]" },
    {
      "<Leader>xi",
      "<CMD>Trouble lsp_implementations toggle focus=false<CR>",
      desc = "LSP implementations [trouble]",
    },
    {
      "<Leader>xr",
      "<CMD>Trouble lsp_references toggle focus=false<CR>",
      desc = "LSP references [trouble]",
    },
    {
      "<Leader>xd",
      "<CMD>Trouble lsp_definitions toggle focus=false<CR>",
      desc = "LSP definitions [trouble]",
    },
    {
      "<Leader>xci",
      "<CMD>Trouble lsp_incoming_calls toggle focus=false<CR>",
      desc = "LSP incoming calls [trouble]",
    },
    {
      "<Leader>xco",
      "<CMD>Trouble lsp_outgoing_calls toggle focus=false<CR>",
      desc = "LSP outgoing calls [trouble]",
    },
    { "<Leader>xL", "<CMD>Trouble loclist toggle<CR>", desc = "Location list [trouble]" },
    { "<Leader>xq", "<CMD>Trouble qflist toggle<CR>", desc = "Quickfix list [trouble]" },

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
  --- @diagnostic enable: missing-parameter,missing-fields

  opts = {
    use_diagnostic_signs = true,
    warn_no_results = false,
    open_no_results = true,
    win = {
      size = 0.2,
    },
    modes = {
      symbols = {
        multiline = false,
        filter = {
          -- remove Package since luals uses it for control flow structures
          ["not"] = { ft = "lua", kind = "Package" },
          any = {
            -- all symbol kinds for help / markdown files
            ft = { "help", "markdown" },
            -- variables in TypeScript files
            { ft = { "vue", "typescript", "javascript" }, kind = "Variable" },
            -- default set of symbol kinds
            kind = {
              "Class",
              "Constructor",
              "Enum",
              "Field",
              "Function",
              "Interface",
              "Method",
              "Module",
              "Namespace",
              "Package",
              "Property",
              "Struct",
              "Trait",
            },
          },
        },
      },
    },
  },

  specs = {
    "nvim-lualine/lualine.nvim",

    opts = function(_, opts)
      local symbols = require("trouble").statusline({
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        -- The following line is needed to fix the background color
        -- Set it to the lualine section you want to use
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols.get,
        cond = symbols.has,
      })
    end,
  },
}
