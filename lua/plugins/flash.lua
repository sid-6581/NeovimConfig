-- Generates a matcher for a mini.ai textobject.
local function gen_miniai(ai_type, id, remote)
  return function()
    local old_virtualedit = vim.opt.virtualedit:get()
    vim.opt.virtualedit:append("onemore")

    require("flash").jump({
      matcher = function()
        local ret = {}
        local region = { from = { line = 1, col = 1 } }

        while true do
          local new_region = require("mini.ai").find_textobject(ai_type, id, {
            reference_region = region,
            search_method = "next",
          })

          if not new_region then
            break
          end

          if new_region.to then
            table.insert(ret, {
              pos = { new_region.from.line, new_region.from.col - 1 },
              end_pos = { new_region.to.line, new_region.to.col - 1 },
            })
          end

          region = { from = { line = new_region.from.line, col = new_region.from.col } }
        end

        return ret
      end,

      search = {
        mode = "search",
        max_length = 0,
      },
      jump = {
        pos = remote and "range" or "start",
      },
      highlight = {
        matches = false,
      },
      remote_op = remote and {
        restore = true,
        motion = true,
      } or nil,
    })

    vim.schedule(function() vim.opt.virtualedit = old_virtualedit end)
  end
end

return {
  "folke/flash.nvim",
  event = "VeryLazy",

  keys = {
    {
      "<Leader>u/",
      function()
        vim.notify(require("flash.plugins.search").enabled and "Disabled flash search" or "Enabled flash search")
        require("flash").toggle()
      end,
      desc = "Toggle Flash search [flash]",
    },
    {
      "gn",
      function() require("flash").treesitter({ jump = { pos = "end" } }) end,
      desc = "Go to treesitter node end [flash]",
    },
    {
      "gN",
      function() require("flash").treesitter({ jump = { pos = "start" } }) end,
      desc = "Go to treesitter node start [flash]",
    },
    {
      "gW",
      function()
        require("flash").jump({
          search = { mode = "search", max_length = 0 },
          highlight = { matches = false },
          pattern = "\\<",
        })
      end,
      desc = "Go to word start [flash]",
    },
    {
      "gib",
      function()
        require("flash").jump({
          search = { mode = "search", max_length = 0 },
          highlight = { matches = false },
          pattern = [[\([{(\[]\_s*\)\@<=\S]],
        })
      end,
      desc = "Go to inner ()/[]/{} [flash]",
    },
    { "n", function() require("flash").treesitter() end, mode = { "o", "x" }, desc = "Treesitter node [flash]" },
    { "N", function() require("flash").treesitter_search() end, mode = { "o", "x" }, desc = "Treesitter node search [flash]" },
    { "r", function() require("flash").remote() end, mode = { "o" }, desc = "Remote [flash]" },
    {
      "arl",
      function()
        require("flash").jump({
          search = { mode = "search", max_length = 0 },
          jump = { pos = "range" },
          highlight = { matches = false },
          pattern = [[^.*$]],
        })
      end,
      mode = { "o", "x" },
      desc = "Remote around line [flash]",
    },
    {
      "irl",
      function()
        require("flash").jump({
          search = { mode = "search", max_length = 0 },
          jump = { pos = "range" },
          highlight = { matches = false },
          pattern = [[^\s*\zs.\{-}\ze\s*$]],
        })
      end,
      mode = { "o", "x" },
      desc = "Remote inside line [flash]",
    },
    { "ara", gen_miniai("a", "a", true), mode = { "o", "x" }, desc = "Remote around argument [flash]" },
    { "ira", gen_miniai("i", "a", true), mode = { "o", "x" }, desc = "Remote inside argument [flash]" },
    { "arb", gen_miniai("a", "b", true), mode = { "o", "x" }, desc = "Remote around ()/[]/{} [flash]" },
    { "irb", gen_miniai("i", "b", true), mode = { "o", "x" }, desc = "Remote inside ()/[]/{} [flash]" },
    { "arq", gen_miniai("a", "q", true), mode = { "o", "x" }, desc = "Remote around \"/'/` [flash]" },
    { "irq", gen_miniai("i", "q", true), mode = { "o", "x" }, desc = "Remote inside \"/'/` [flash]" },
    { "arf", gen_miniai("a", "f", true), mode = { "o", "x" }, desc = "Remote around function call [flash]" },
    { "irf", gen_miniai("i", "f", true), mode = { "o", "x" }, desc = "Remote inside function call [flash]" },
    { "arF", gen_miniai("a", "F", true), mode = { "o", "x" }, desc = "Remote outer function [flash]" },
    { "irF", gen_miniai("i", "F", true), mode = { "o", "x" }, desc = "Remote inner function [flash]" },
    { "ar\"", gen_miniai("a", "\"", true), mode = { "o", "x" }, desc = "Remote around \" [flash]" },
    { "ir\"", gen_miniai("i", "\"", true), mode = { "o", "x" }, desc = "Remote inside \" [flash]" },
    { "ar'", gen_miniai("a", "'", true), mode = { "o", "x" }, desc = "Remote around ' [flash]" },
    { "ir'", gen_miniai("i", "'", true), mode = { "o", "x" }, desc = "Remote inside ' [flash]" },
    { "ar)", gen_miniai("a", ")", true), mode = { "o", "x" }, desc = "Remote around () [flash]" },
    { "ir)", gen_miniai("i", ")", true), mode = { "o", "x" }, desc = "Remote inside () [flash]" },
    { "ar}", gen_miniai("a", "}", true), mode = { "o", "x" }, desc = "Remote around {} [flash]" },
    { "ir}", gen_miniai("i", "}", true), mode = { "o", "x" }, desc = "Remote inside {} [flash]" },
    { "ar>", gen_miniai("a", ">", true), mode = { "o", "x" }, desc = "Remote around <> [flash]" },
    { "ir>", gen_miniai("i", ">", true), mode = { "o", "x" }, desc = "Remote inside <> [flash]" },
    { "ar(", gen_miniai("a", "(", true), mode = { "o", "x" }, desc = "Remote around () [flash]" },
    { "ir(", gen_miniai("i", "(", true), mode = { "o", "x" }, desc = "Remote inside () [flash]" },
    { "ar{", gen_miniai("a", "{", true), mode = { "o", "x" }, desc = "Remote around {} [flash]" },
    { "ir{", gen_miniai("i", "{", true), mode = { "o", "x" }, desc = "Remote inside {} [flash]" },
    { "ar<", gen_miniai("a", "<", true), mode = { "o", "x" }, desc = "Remote around <> [flash]" },
    { "ir<", gen_miniai("i", "<", true), mode = { "o", "x" }, desc = "Remote inside <> [flash]" },
    -- { "gib", gen_miniai("i", "b", false), desc = "Remote ()/[]/{} [flash]" },
    { "giq", gen_miniai("i", "q", false), desc = "Remote \"/'/` [flash]" },
    { "gif", gen_miniai("i", "f", false), desc = "Remote function call [flash]" },
    { "giF", gen_miniai("i", "F", false), desc = "Remote function [flash]" },
    { "gia", gen_miniai("i", "a", false), desc = "Remote argument [flash]" },
  },

  opts = {
    search = {
      multi_window = false,
    },

    highlight = {
      backdrop = false,
    },

    label = {
      before = true,
      after = false,
      style = "overlay",
      reuse = "all",
    },

    modes = {
      char = {
        enabled = false,
      },

      search = {
        enabled = true,
        incremental = true,
        labels = "ASDFGHJKLQWERTYUIOPZXCVBNM",
      },

      treesitter_search = {
        labels = "ASDFGHJKLQWERTYUIOPZXCVBNM",
        remote_op = { restore = true, motion = true },
      },

      remote = {
        labels = "ASDFGHJKLQWERTYUIOPZXCVBNM",
      },
    },
  },

  config = function(_, opts)
    require("flash").setup(opts)
    local colors = require("gruvbox").palette
    vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ffffff", bg = colors.faded_red })
    vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = colors.gray })
  end,
}
