return {
  "echasnovski/mini.hipatterns",
  event = "VeryLazy",

  opts = {
    highlighters = {
      fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
      hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
      todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
      note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

      scriban_block = {
        pattern = function(_buf_id)
          if vim.fn.expand("%:e") ~= "sbntxt" then
            return nil
          end

          return "{{[^}]-}}"
        end,

        group = "Comment",
      },
    },
  },
}
