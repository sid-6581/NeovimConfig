return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>gw", "<CMD>DiffviewOpen<CR>", desc = "Git diff working tree [diffview]" },
    { "<Leader>gf", "<CMD>DiffviewFileHistory %<CR>", desc = "Git file history [diffview]" },
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
