return {
  "nvim-mini/mini.ai",
  event = "VeryLazy",

  opts = function()
    local gen_spec = require("mini.ai").gen_spec

    return {
      custom_textobjects = {
        a = gen_spec.argument({
          brackets = { "%b()", "%b[]", "%b{}", "%b<>", "%||" },
          separator = "%s*[,;]%s*",
        }),
        b = { { "%b()", "%b[]", "%b{}", "%b<>" }, "^.().*().$" },
        F = gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
        o = gen_spec.treesitter({
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }, {}),
        t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
      },
      n_lines = 5000,
      search_method = "cover",
      silent = true,
    }
  end,
}
