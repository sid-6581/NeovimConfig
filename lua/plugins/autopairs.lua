return {
  "windwp/nvim-autopairs",
  event = "VeryLazy",

  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string", "comment" }, -- it will not add a pair on that treesitter node
    },
  },

  config = function(_, opts)
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")
    local npairs_cmp = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    local cond = require("nvim-autopairs.conds")

    npairs.setup(opts)

    npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
    cmp.event:on("confirm_done", npairs_cmp.on_confirm_done())

    -- Add spaces between parentheses
    local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
    npairs.add_rules({
      -- Rule for a pair with left-side ' ' and right side ' '
      Rule(" ", " ")
        -- Pair will only occur if the conditional function returns true
        :with_pair(function(opts)
          -- We are checking if we are inserting a space in (), [], or {}
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({
            brackets[1][1] .. brackets[1][2],
            brackets[2][1] .. brackets[2][2],
            brackets[3][1] .. brackets[3][2],
          }, pair)
        end)
        :with_move(cond.none())
        :with_cr(cond.none())
        -- We only want to delete the pair of spaces when the cursor is as such: ( | )
        :with_del(function(opts)
          local col = vim.api.nvim_win_get_cursor(0)[2]
          local context = opts.line:sub(col - 1, col + 2)
          return vim.tbl_contains({
            brackets[1][1] .. "  " .. brackets[1][2],
            brackets[2][1] .. "  " .. brackets[2][2],
            brackets[3][1] .. "  " .. brackets[3][2],
          }, context)
        end),
    })
    -- For each pair of brackets we will add another rule
    for _, bracket in pairs(brackets) do
      npairs.add_rules({
        -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
        Rule(bracket[1] .. " ", " " .. bracket[2])
          :with_pair(cond.none())
          :with_move(function(opts) return opts.char == bracket[2] end)
          :with_del(cond.none())
          :use_key(bracket[2])
          -- Removes the trailing whitespace that can occur without this
          :replace_map_cr(
            function(_) return "<C-c>2xi<CR><C-c>O" end
          ),
      })
    end

    -- Move past commas and semicolons
    for _, punct in pairs({ ",", ";" }) do
      require("nvim-autopairs").add_rules({
        require("nvim-autopairs.rule")("", punct)
          :with_move(function(opts) return opts.char == punct end)
          :with_pair(function() return false end)
          :with_del(function() return false end)
          :with_cr(function() return false end)
          :use_key(punct),
      })
    end
  end,
}
