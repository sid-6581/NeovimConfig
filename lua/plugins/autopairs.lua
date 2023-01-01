return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",

  config = function()
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")
    local npairs_cmp = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    npairs.setup({
      check_ts = true,
      ts_config = {
        lua = { "string", "comment" }, -- it will not add a pair on that treesitter node
      },
    })

    npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
    cmp.event:on("confirm_done", npairs_cmp.on_confirm_done())

    -- Add spaces between pairs
    local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
    npairs.add_rules({
      Rule(" ", " "):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({
          brackets[1][1] .. brackets[1][2],
          brackets[2][1] .. brackets[2][2],
          brackets[3][1] .. brackets[3][2],
        }, pair)
      end),
    })
    for _, bracket in pairs(brackets) do
      npairs.add_rules({
        Rule(bracket[1] .. " ", " " .. bracket[2])
          :with_pair(function()
            return false
          end)
          :with_move(function(opts)
            return opts.prev_char:match(".%" .. bracket[2]) ~= nil
          end)
          :use_key(bracket[2]),
      })
    end
  end,
}
