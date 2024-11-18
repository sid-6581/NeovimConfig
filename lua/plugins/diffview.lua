return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>gf", "<CMD>DiffviewFileHistory %<CR>", desc = "Git file history [diffview]" },
    { "<Leader>gh", "<CMD>DiffviewFileHistory<CR>", desc = "Git history [diffview]" },
    { "<Leader>gd", "<CMD>DiffviewOpen<CR>", desc = "Git diff working tree [diffview]" },
  },

  opts = {
    enhanced_diff_hl = true,
  },

  config = function(_, opts)
    require("diffview").setup(opts)

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "DiffviewFileHistory", "DiffviewFiles" },
      callback = function(event)
        require("which-key").add({ "q", "<CMD>tabclose<CR>", buffer = event.buf, desc = "Close tab [diffview]" })
      end,
    })
  end,
}
